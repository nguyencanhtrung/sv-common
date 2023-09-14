//---------------------------------------------------------------------------
//           ___  _    __         =        ___  _  __    __ ___            --   
//          / ._\| |  / /         =       /   | \\/ /   / // ._\           --         
//          \ __ | | / /          =      / /| |  / /   / / \ __            --
//        ____. \| |/ /           =     / /_| | / /\  / /____. \           --
//       /______/|___/            =    /_/  |_|/_/ \\/_//______/           --
//                              =====                                      --
//                               ===                                       --
//------------------------------  =  ----------------------------------------
// Copyright © 2023, 2024 - Nguyen Canh Trung
// (nguyencanhtrung 'at' me 'dot' com)
//
// Permission is hereby granted, free of charge, to any person obtaining a
// copy of this software and associated documentation files (the "Software"),
// to deal in the Software without restriction, including without limitation
// the rights to use, copy, modify, merge, publish, distribute, sublicense,
// and/or sell copies of the Software, and to permit persons to whom the
// Software is furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
// DEALINGS IN THE SOFTWARE.
//
// DEPENDENCIES: none
// Language: SystemVerilog 

interface ifc_axis #(
    parameter DATA_WIDTH = 32,
    parameter KEEP_WIDTH = (DATA_WIDTH/8),
    parameter USER_WIDTH = 1,
    parameter ID_WIDTH   = 1,
    parameter DEST_WIDTH = 1
)
(
    input clk,
    input rst
);

    logic [DATA_WIDTH-1:0]  tdata;
    logic                   tvalid;
    logic                   tready;
    logic                   tlast;
    logic [KEEP_WIDTH-1:0]  tkeep;
    logic [USER_WIDTH-1:0]  tuser;
    logic [ID_WIDTH-1:0]    tid;
    logic [DEST_WIDTH-1:0]  tdest;

    modport master(
        input   clk,
        input   rst,
        output  tdata,
        output  tvalid,
        input   tready,
        output  tlast,
        output  tkeep,
        output  tuser,
        output  tid,
        output  tdest
    );

    modport slave(
        input   clk,
        input   rst,
        input   tdata,
        input   tvalid,
        output  tready,
        input   tlast,
        input   tkeep,
        input   tuser,
        input   tid,
        input   tdest
    );
endinterface