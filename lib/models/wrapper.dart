import 'package:equatable/equatable.dart';

class ListWrap<T> extends Equatable {
  List<T> list;

  ListWrap({required this.list});

  void add(T data) {
    list.add(data);
  }

  void addAll(List<T> data) {
    list.addAll(data);
  }

  void remove(T data) {
    list.remove(data);
  }

  void removeAt(int index) {
    list.removeAt(index);
  }

  void updateAt(T data, int index) {
    list[index] = data;
  }

  bool isEmpty() => list.isEmpty;

  bool isNotEmpty() => list.isNotEmpty;

  int size() => list.length;

  List<T> getList() => list;

  @override
  List<Object?> get props => list;
}
