import 'package:mind_control/models/diary.dart';
import 'package:mind_control/models/feeling_emotion.dart';
import 'package:mind_control/models/task.dart';
import 'constants.dart';

const String recordString =
    """생활 주변에서 일어나는 사소한 일을 소재로 가볍게 쓴 글이므로 수필에 속하며, 개인적, 주관적, 감성적, 정서적 특성을 지니므로 수필 중에서 경수필에 속한다.

초등학교 1학년까진 보통 그림일기를 쓰고, 초등학교 고학년 이후로는 줄공책에 일기를 쓰게 된다. 성인이 돼서는 쓰는 사람이 매우 드물지만 쓰는 사람들은 디지털 기기(노트북, 휴대폰, 태블릿 등)를 사용하거나 수첩에 개인적으로 기록하는 경향이 잦다.""";

List<Goal> tasks = [
  Goal(id: '1', title: '운동하기', isChecked: true),
  Goal(id: '2', title: '책읽기'),
  Goal(id: '3', title: '영어공부'),
  Goal(id: '4', title: '환기하기'),
];

List<Goal> tasks2 = [
  Goal(id: '5', title: '운동하기', isChecked: true),
  Goal(id: '6', title: '책읽기'),
  Goal(id: '7', title: '영어공부'),
  Goal(id: '8', title: '환기하기', isChecked: true),
];

List<Goal> tasks3 = [
  Goal(id: '9', title: '운동하기', isChecked: true),
  Goal(id: '10', title: '책읽기', isChecked: true),
  Goal(id: '11', title: '영어공부', isChecked: true),
  Goal(id: '12', title: '환기하기', isChecked: true),
];

List<Diary> fakeData = [
  Diary(
    id: '1',
    tasks: tasks,
    date: '4월 21일',
    mindState: littleBitHappy,
    content: recordString,
  ),
  Diary(
    id: '2',
    tasks: tasks2,
    date: '4월 22일',
    mindState: common,
    content: recordString,
  ),
  Diary(
    id: '3',
    tasks: tasks3,
    date: '4월 23일',
    mindState: soHappy,
    content: recordString,
  ),
  Diary(
    id: '4',
    tasks: tasks,
    date: '4월 24일',
    mindState: soUnHappy,
    content: recordString,
  ),
  Diary(
    id: '5',
    tasks: tasks2,
    date: '4월 25일',
    mindState: littleBitHappy,
    content: recordString,
  ),
  Diary(
    id: '6',
    tasks: tasks3,
    date: '4월 26일',
    mindState: common,
    content: recordString,
  ),
  Diary(
    id: '7',
    tasks: tasks,
    date: '4월 27일',
    mindState: littleBitHappy,
    content: recordString,
  ),
  Diary(
    id: '8',
    tasks: tasks2,
    date: '4월 28일',
    mindState: common,
    content: recordString,
  ),
  Diary(
    id: '9',
    tasks: tasks3,
    date: '4월 29일',
    mindState: soUnHappy,
    content: recordString,
  ),
];
