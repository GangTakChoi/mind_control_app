import 'package:mind_control/models/day_record_bundle.dart';
import 'package:mind_control/models/feeling_emotion.dart';
import 'package:mind_control/models/task.dart';

const String recordString =
    """생활 주변에서 일어나는 사소한 일을 소재로 가볍게 쓴 글이므로 수필에 속하며, 개인적, 주관적, 감성적, 정서적 특성을 지니므로 수필 중에서 경수필에 속한다.

초등학교 1학년까진 보통 그림일기를 쓰고, 초등학교 고학년 이후로는 줄공책에 일기를 쓰게 된다. 성인이 돼서는 쓰는 사람이 매우 드물지만 쓰는 사람들은 디지털 기기(노트북, 휴대폰, 태블릿 등)를 사용하거나 수첩에 개인적으로 기록하는 경향이 잦다.""";

List<Task> tasks = [
  Task(title: '운동하기', isChecked: true),
  Task(title: '책읽기', isChecked: true),
  Task(title: '영어공부'),
  Task(title: '환기하기'),
];

List<Task> tasks2 = [
  Task(title: '운동하기', isChecked: true),
  Task(title: '책읽기'),
  Task(title: '영어공부', isChecked: true),
  Task(title: '환기하기', isChecked: true),
];

List<Task> tasks3 = [
  Task(title: '운동하기', isChecked: true),
  Task(title: '책읽기', isChecked: true),
  Task(title: '영어공부', isChecked: true),
  Task(title: '환기하기', isChecked: true),
  Task(title: '운동하기2', isChecked: true),
  Task(title: '책읽기2', isChecked: true),
  Task(title: '영어공부2', isChecked: true),
  Task(title: '환기하기2', isChecked: true),
  Task(title: '운동하기3', isChecked: true),
  Task(title: '책읽기3', isChecked: true),
  Task(title: '영어공부3', isChecked: true),
  Task(title: '환기하기3', isChecked: true),
];

List<DayRecordBundle> fakeData = [
  DayRecordBundle(
    tasks: tasks,
    date: '4월 21일',
    feelingValue: FeelingValue.littleBitUnHappy,
    recordOfDay: recordString,
  ),
  DayRecordBundle(
    tasks: tasks2,
    date: '4월 22일',
    feelingValue: FeelingValue.common,
  ),
  DayRecordBundle(
    tasks: tasks3,
    date: '4월 23일',
    feelingValue: FeelingValue.soHappy,
    recordOfDay: '상쾌한 하루이구나~3',
  ),
  DayRecordBundle(
    tasks: tasks,
    date: '4월 24일',
    feelingValue: FeelingValue.soUnHappy,
    recordOfDay: '상쾌한 하루이구나~4',
  ),
  DayRecordBundle(
    tasks: tasks2,
    date: '4월 25일',
    feelingValue: FeelingValue.littleBitHappy,
    recordOfDay: '상쾌한 하루이구나~5',
  ),
  DayRecordBundle(
    tasks: tasks3,
    date: '4월 26일',
    feelingValue: FeelingValue.common,
    recordOfDay: '상쾌한 하루이구나~6',
  ),
  DayRecordBundle(
    tasks: tasks,
    date: '4월 27일',
    feelingValue: FeelingValue.littleBitUnHappy,
    recordOfDay: '상쾌한 하루이구나~7',
  ),
  DayRecordBundle(
    tasks: tasks2,
    date: '4월 28일',
    feelingValue: FeelingValue.common,
    recordOfDay: '상쾌한 하루이구나~8 \n 상쾌한 하루이구나~8\n상쾌한 하루이구나~8',
  ),
  DayRecordBundle(
    tasks: tasks3,
    date: '4월 29일',
    feelingValue: FeelingValue.soUnHappy,
    recordOfDay: '상쾌한 하루이구나~9',
  ),
];
