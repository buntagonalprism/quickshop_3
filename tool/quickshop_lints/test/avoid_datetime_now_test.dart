import 'package:analyzer_testing/analysis_rule/analysis_rule.dart';
import 'package:quickshop_lints/src/avoid_datetime_now.dart';
import 'package:test_reflective_loader/test_reflective_loader.dart';

void main() {
  defineReflectiveSuite(() {
    defineReflectiveTests(AvoidDateTimeNowTest);
    defineReflectiveTests(AvoidDateTimeNowOutsideLibTest);
  });
}

@reflectiveTest
class AvoidDateTimeNowTest extends AnalysisRuleTest {
  @override
  void setUp() {
    rule = AvoidDateTimeNow();
    super.setUp();
  }

  Future<void> test_call() async {
    const code = '''
DateTime f() => DateTime.now();
''';
    await assertDiagnostics(code, [
      lint(code.indexOf('DateTime.now()'), 'DateTime.now()'.length),
    ]);
  }

  Future<void> test_tearOff() async {
    const code = '''
DateTime Function() f() => DateTime.now;
''';
    await assertDiagnostics(code, [
      lint(code.indexOf('DateTime.now'), 'DateTime.now'.length),
    ]);
  }

  Future<void> test_importPrefix() async {
    const code = '''
import 'dart:core' as core;
core.DateTime f() => core.DateTime.now();
''';
    await assertDiagnostics(code, [
      lint(code.indexOf('core.DateTime.now()'), 'core.DateTime.now()'.length),
    ]);
  }

  Future<void> test_otherUseOfDateTime() async {
    // The test SDK's DateTime only has a now() constructor, so this checks a type reference instead
    await assertNoDiagnostics('''
int f(DateTime time) => time.millisecondsSinceEpoch;
''');
  }

  Future<void> test_otherClassNamedDateTime() async {
    await assertNoDiagnostics('''
class DateTime {
  DateTime.now();
}
DateTime f() => DateTime.now();
''');
  }
}

@reflectiveTest
class AvoidDateTimeNowOutsideLibTest extends AnalysisRuleTest {
  @override
  String get testFilePath => '$testPackageRootPath/test/some_test.dart';

  @override
  void setUp() {
    rule = AvoidDateTimeNow();
    super.setUp();
  }

  Future<void> test_testDirectory() async {
    await assertNoDiagnostics('''
DateTime f() => DateTime.now();
''');
  }
}
