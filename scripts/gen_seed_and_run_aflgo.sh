#!/bin/bash
# Copyright 2020 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cd $SRC/circuits/$CORE
make seed
$SRC/aflgo/afl-fuzz \
    -S $CORE \
    -z exp \
    -c 45m \
    -i $SRC/circuits/$CORE/afl_in \
    -o $SRC/circuits/$CORE/afl_out \
    $SRC/circuits/$CORE/$BIN_DIR/V$CORE @@
