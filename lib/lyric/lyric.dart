class Lyric {
  String lyric;
  Duration startTime;
  Duration endTime;
  bool isRemark;

  Lyric(
    this.lyric, {
    required this.startTime,
    required this.endTime,
    this.isRemark = false,
  });

  @override
  String toString() {
    return 'Lyric{lyric: $lyric, startTime: $startTime, endTime: $endTime}';
  }
}
