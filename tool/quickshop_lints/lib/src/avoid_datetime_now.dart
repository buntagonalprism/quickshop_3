import 'package:analyzer/analysis_rule/analysis_rule.dart';
import 'package:analyzer/analysis_rule/rule_context.dart';
import 'package:analyzer/analysis_rule/rule_visitor_registry.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/error/error.dart';

/// Flags `DateTime.now` under `lib/`, where the current time should come from `clock.now()` so
/// that `fake_async` can control it in tests.
class AvoidDateTimeNow extends AnalysisRule {
  static const LintCode code = LintCode(
    'avoid_datetime_now',
    'Use clock.now() instead of DateTime.now().',
    correctionMessage:
        "Try 'clock.now()' from package:clock, which fake_async can control. "
        'To measure elapsed time, use a Stopwatch.',
  );

  AvoidDateTimeNow()
    : super(
        name: 'avoid_datetime_now',
        description: 'Get the current time from clock.now() rather than DateTime.now().',
      );

  @override
  LintCode get diagnosticCode => code;

  @override
  void registerNodeProcessors(RuleVisitorRegistry registry, RuleContext context) {
    if (!context.isInLibDir) {
      return;
    }
    final visitor = _Visitor(this);
    // A call, such as `DateTime.now()`
    registry.addInstanceCreationExpression(this, visitor);
    // A tear-off, such as `DateTime.now` passed as a function
    registry.addConstructorReference(this, visitor);
  }
}

class _Visitor extends SimpleAstVisitor<void> {
  _Visitor(this.rule);

  final AnalysisRule rule;

  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    if (_isDateTimeNow(node.constructorName.element)) {
      rule.reportAtNode(node);
    }
  }

  @override
  void visitConstructorReference(ConstructorReference node) {
    if (_isDateTimeNow(node.constructorName.element)) {
      rule.reportAtNode(node);
    }
  }

  /// Matches the resolved constructor rather than the source text, so an import prefix such as
  /// `core.DateTime.now()` is still caught, and a different class named `DateTime` isn't.
  bool _isDateTimeNow(ConstructorElement? constructor) {
    return constructor != null &&
        constructor.name == 'now' &&
        constructor.enclosingElement.name == 'DateTime' &&
        constructor.library.isDartCore;
  }
}
