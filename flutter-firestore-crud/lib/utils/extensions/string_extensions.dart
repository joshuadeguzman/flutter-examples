// Copyright 2020 Joshua de Guzman (https://joshuadeguzman.github.io). All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

extension StringExtensions on String {
  String substringSafe(int start, int end) {
    return this.substring(start, end > this.length ? this.length : end);
  }
}
