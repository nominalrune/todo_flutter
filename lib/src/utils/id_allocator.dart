class IdAllocator {
  int _current;
  IdAllocator(this._current);
  
  int get next {
    return ++_current;
  }

  int get now {
    return _current;
  }
}
