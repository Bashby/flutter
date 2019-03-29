import 'dart:math';

class Quicksort {
  static quicksort(List items, int low, int high) {
    print('saw $items $low $high');

    if(high - low < 2) {
      return;
    }

    int pivot = high;

    print('pivoting on ${items[pivot]}');

    int i = low;
    int j = i;
    while(i < high) {
      if(items[i] < items[pivot]) {
        swap(items, i, j);
        j++;
      }
      i++;
    }
    swap(items, j, pivot);

    print('pivoted $items');

    quicksort(items, low, j-1);
    quicksort(items, j, high);
  }

  static swap(List items, int a, int b) {
    int temp = items[a];
    items[a] = items[b];
    items[b] = temp;
  }
}

main() {
  int listSize = 50;
  List<int> items = [];
  while(listSize > 0) {
    items.add(Random().nextInt(100));
    listSize--;
  }
  print(items);
  Quicksort.quicksort(items, 0, items.length - 1);
  print(items);
}