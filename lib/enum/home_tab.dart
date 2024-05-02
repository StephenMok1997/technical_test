enum HomeTab {
  list('List', 0),
  dashboard('Dashboard', 1);

  const HomeTab(
    this.text,
    this.tabIndex,
  );
  final String text;
  final int tabIndex;
}
