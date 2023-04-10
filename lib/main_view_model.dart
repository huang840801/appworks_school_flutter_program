class MainViewModel {
  final int selectedColorIndex;
  final int selectedSizeIndex;

  MainViewModel({this.selectedColorIndex = 0, this.selectedSizeIndex = 0});

  MainViewModel selectColor({int? selectedColorIndex, int? selectedSizeIndex}) {
    return MainViewModel(
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
      selectedSizeIndex: selectedSizeIndex ?? this.selectedSizeIndex
    );
  }

  MainViewModel selectSize({int? selectedColorIndex, int? selectedSizeIndex}) {
    return MainViewModel(
      selectedColorIndex: selectedColorIndex ?? this.selectedColorIndex,
      selectedSizeIndex: selectedSizeIndex ?? this.selectedSizeIndex
    );
  }
}
