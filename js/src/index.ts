/******************************************************************************
 *
 * Copyright (c) 2020, the jupyterlab_iex authors.
 *
 * This file is part of the jupyterlab_iex library, distributed under the terms of
 * the Apache License 2.0.  The full license can be found in the LICENSE file.
 *
 */
import {
  ILayoutRestorer, JupyterFrontEnd, JupyterFrontEndPlugin,
} from "@jupyterlab/application";

import {
  ICommandPalette,
} from "@jupyterlab/apputils";

// import {
//   PageConfig,
// } from "@jupyterlab/coreutils";

import {
  IDocumentManager,
} from "@jupyterlab/docmanager";

import {
  IFileBrowserFactory,
} from "@jupyterlab/filebrowser";

import {
  ILauncher,
} from "@jupyterlab/launcher";

import {
  IMainMenu,
} from "@jupyterlab/mainmenu";

// import {
//   Widget,
// } from "@lumino/widgets";

// import {
//   IRequestResult, request,
// } from "requests-helper";


import "../style/index.css";

const extension: JupyterFrontEndPlugin<void> = {
  activate,
  autoStart: true,
  id: "jupyterlab_iex",
  optional: [ILauncher],
  requires: [IDocumentManager, ICommandPalette, ILayoutRestorer, IMainMenu, IFileBrowserFactory],
};


function activate(app: JupyterFrontEnd,
                  docManager: IDocumentManager,
                  palette: ICommandPalette,
                  restorer: ILayoutRestorer,
                  menu: IMainMenu,
                  browser: IFileBrowserFactory,
                  launcher: ILauncher | null) {

  // eslint-disable-next-line no-console
  console.log("JupyterLab extension jupyterlab_iex is activated!");
}

export default extension;
export {activate as _activate};
