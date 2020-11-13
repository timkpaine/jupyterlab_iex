# *****************************************************************************
#
# Copyright (c) 2020, the jupyterlab_iex authors.
#
# This file is part of the jupyterlab_iex library, distributed under the terms of
# the Apache License 2.0.  The full license can be found in the LICENSE file.
#
# for Coverage
from jupyterlab_iex import _jupyter_server_extension_paths


class TestInit:
    def test__jupyter_server_extension_paths(self):
        assert _jupyter_server_extension_paths() == [{"module": "jupyterlab_iex.extension"}]
