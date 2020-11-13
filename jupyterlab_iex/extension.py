# *****************************************************************************
#
# Copyright (c) 2020, the jupyterlab_iex authors.
#
# This file is part of the jupyterlab_iex library, distributed under the terms of
# the Apache License 2.0.  The full license can be found in the LICENSE file.
#


def load_jupyter_server_extension(nb_server_app):
    """
    Called when the extension is loaded.

    Args:
        nb_server_app (NotebookWebApplication): handle to the Notebook webserver instance.
    """
    web_app = nb_server_app.web_app
    # template_dirs = nb_server_app.config.get('JupyterLabTemplates', {}).get('template_dirs', [])

    # base_url = web_app.settings['base_url']

    # host_pattern = '.*$'
    # print('Installing jupyterlab_iex handler on path %s' % url_path_join(base_url, 'templates'))

    # web_app.add_handlers(host_pattern, [(url_path_join(base_url, 'templates/names'), TemplateNamesHandler, {'loader': loader})])

