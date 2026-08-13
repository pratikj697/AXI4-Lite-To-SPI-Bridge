# AXI4-Lite-To-SPI-Bridge

## Block Diagram:
  <img width="2030" height="1666" alt="AXI4 Lite to SPI Bridge drawio" src="https://github.com/user-attachments/assets/b4878d16-6f73-4c0b-8640-349fe15cddad" />

## Simulation in QuestaSim:
  <img width="1919" height="1037" alt="Concurrent Fifo Test" src="https://github.com/user-attachments/assets/8f9e16d9-2d77-41c3-9f41-be90cbcae344" />

## RTL in Vivado:
  <img width="2471" height="1102" alt="RTL_schematic" src="https://github.com/user-attachments/assets/69542098-2558-49ce-8ab0-7d77746e41ed" />

## Synthesized in Vivado:
  <img width="2550" height="1671" alt="Syn_schematic" src="https://github.com/user-attachments/assets/3af5162f-d6c4-4581-9129-a6104190cfd9" />

## Utilization Report:
--------------------------------------------------------------------------------------------------------------------------------------------------------
| Tool Version : Vivado v.2025.2 (win64) Build 6299465 Fri Nov 14 19:35:11 GMT 2025
| Date         : Sat Aug  8 21:57:57 2026
| Host         : Pratik running 64-bit major release  (build 9200)
| Command      : report_utilization -hierarchical_min_primitive_count 50 -file C:/Users/Asus/Downloads/files/utilization_report.txt -name utilization_2
| Design       : AXI_SPI_BRIDGE_TOP
| Device       : xc7a35tcpg236-1
| Speed File   : -1
| Design State : Synthesized
--------------------------------------------------------------------------------------------------------------------------------------------------------

Utilization Design Information

1. Slice Logic
--------------

+-------------------------+------+-------+------------+-----------+-------+
|        Site Type        | Used | Fixed | Prohibited | Available | Util% |
+-------------------------+------+-------+------------+-----------+-------+
| Slice LUTs*             |  739 |     0 |          0 |     20800 |  3.55 |
|   LUT as Logic          |  739 |     0 |          0 |     20800 |  3.55 |
|   LUT as Memory         |    0 |     0 |          0 |      9600 |  0.00 |
| Slice Registers         |  668 |     0 |          0 |     41600 |  1.61 |
|   Register as Flip Flop |  531 |     0 |          0 |     41600 |  1.28 |
|   Register as Latch     |  137 |     0 |          0 |     41600 |  0.33 |
| F7 Muxes                |    3 |     0 |          0 |     16300 |  0.02 |
| F8 Muxes                |    1 |     0 |          0 |      8150 |  0.01 |
| Unique Control Sets     |  431 |       |          0 |      8150 |  5.29 |
+-------------------------+------+-------+------------+-----------+-------+


1.1 Summary of Registers by Type
--------------------------------

+-------+--------------+-------------+--------------+
| Total | Clock Enable | Synchronous | Asynchronous |
+-------+--------------+-------------+--------------+
| 0     |            _ |           - |            - |
| 0     |            _ |           - |          Set |
| 0     |            _ |           - |        Reset |
| 0     |            _ |         Set |            - |
| 0     |            _ |       Reset |            - |
| 0     |          Yes |           - |            - |
| 145   |          Yes |           - |          Set |
| 347   |          Yes |           - |        Reset |
| 10    |          Yes |         Set |            - |
| 166   |          Yes |       Reset |            - |
+-------+--------------+-------------+--------------+


2. Memory
---------

+-------------------+------+-------+------------+-----------+-------+
|     Site Type     | Used | Fixed | Prohibited | Available | Util% |
+-------------------+------+-------+------------+-----------+-------+
| Block RAM Tile    |    1 |     0 |          0 |        50 |  2.00 |
|   RAMB36/FIFO*    |    0 |     0 |          0 |        50 |  0.00 |
|   RAMB18          |    2 |     0 |          0 |       100 |  2.00 |
|     RAMB18E1 only |    2 |       |            |           |       |
+-------------------+------+-------+------------+-----------+-------+
* Note: Each Block RAM Tile only has one FIFO logic available and therefore can accommodate only one FIFO36E1 or one FIFO18E1. However, if a FIFO18E1 occupies a Block RAM Tile, that tile can still accommodate a RAMB18E1


3. DSP
------

+-----------+------+-------+------------+-----------+-------+
| Site Type | Used | Fixed | Prohibited | Available | Util% |
+-----------+------+-------+------------+-----------+-------+
| DSPs      |    0 |     0 |          0 |        90 |  0.00 |
+-----------+------+-------+------------+-----------+-------+


4. IO and GT Specific
---------------------

+-----------------------------+------+-------+------------+-----------+--------+
|          Site Type          | Used | Fixed | Prohibited | Available |  Util% |
+-----------------------------+------+-------+------------+-----------+--------+
| Bonded IOB                  |  112 |     0 |          0 |       106 | 105.66 |
| Bonded IPADs                |    0 |     0 |          0 |        10 |   0.00 |
| Bonded OPADs                |    0 |     0 |          0 |         4 |   0.00 |
| PHY_CONTROL                 |    0 |     0 |          0 |         5 |   0.00 |
| PHASER_REF                  |    0 |     0 |          0 |         5 |   0.00 |
| OUT_FIFO                    |    0 |     0 |          0 |        20 |   0.00 |
| IN_FIFO                     |    0 |     0 |          0 |        20 |   0.00 |
| IDELAYCTRL                  |    0 |     0 |          0 |         5 |   0.00 |
| IBUFDS                      |    0 |     0 |          0 |       104 |   0.00 |
| GTPE2_CHANNEL               |    0 |     0 |          0 |         2 |   0.00 |
| PHASER_OUT/PHASER_OUT_PHY   |    0 |     0 |          0 |        20 |   0.00 |
| PHASER_IN/PHASER_IN_PHY     |    0 |     0 |          0 |        20 |   0.00 |
| IDELAYE2/IDELAYE2_FINEDELAY |    0 |     0 |          0 |       250 |   0.00 |
| IBUFDS_GTE2                 |    0 |     0 |          0 |         2 |   0.00 |
| ILOGIC                      |    0 |     0 |          0 |       106 |   0.00 |
| OLOGIC                      |    0 |     0 |          0 |       106 |   0.00 |
+-----------------------------+------+-------+------------+-----------+--------+


5. Clocking
-----------

+------------+------+-------+------------+-----------+-------+
|  Site Type | Used | Fixed | Prohibited | Available | Util% |
+------------+------+-------+------------+-----------+-------+
| BUFGCTRL   |    2 |     0 |          0 |        32 |  6.25 |
| BUFIO      |    0 |     0 |          0 |        20 |  0.00 |
| MMCME2_ADV |    0 |     0 |          0 |         5 |  0.00 |
| PLLE2_ADV  |    0 |     0 |          0 |         5 |  0.00 |
| BUFMRCE    |    0 |     0 |          0 |        10 |  0.00 |
| BUFHCE     |    0 |     0 |          0 |        72 |  0.00 |
| BUFR       |    0 |     0 |          0 |        20 |  0.00 |
+------------+------+-------+------------+-----------+-------+


6. Specific Feature
-------------------

+-------------+------+-------+------------+-----------+-------+
|  Site Type  | Used | Fixed | Prohibited | Available | Util% |
+-------------+------+-------+------------+-----------+-------+
| BSCANE2     |    0 |     0 |          0 |         4 |  0.00 |
| CAPTUREE2   |    0 |     0 |          0 |         1 |  0.00 |
| DNA_PORT    |    0 |     0 |          0 |         1 |  0.00 |
| EFUSE_USR   |    0 |     0 |          0 |         1 |  0.00 |
| FRAME_ECCE2 |    0 |     0 |          0 |         1 |  0.00 |
| ICAPE2      |    0 |     0 |          0 |         2 |  0.00 |
| PCIE_2_1    |    0 |     0 |          0 |         1 |  0.00 |
| STARTUPE2   |    0 |     0 |          0 |         1 |  0.00 |
| XADC        |    0 |     0 |          0 |         1 |  0.00 |
+-------------+------+-------+------------+-----------+-------+


7. Primitives
-------------

+----------+------+---------------------+
| Ref Name | Used | Functional Category |
+----------+------+---------------------+
| LUT6     |  329 |                 LUT |
| LUT5     |  299 |                 LUT |
| FDCE     |  210 |        Flop & Latch |
| LUT3     |  185 |                 LUT |
| FDRE     |  166 |        Flop & Latch |
| FDPE     |  145 |        Flop & Latch |
| LDCE     |  137 |        Flop & Latch |
| LUT2     |   99 |                 LUT |
| IBUF     |   61 |                  IO |
| OBUF     |   51 |                  IO |
| LUT4     |   29 |                 LUT |
| FDSE     |   10 |        Flop & Latch |
| MUXF7    |    3 |               MuxFx |
| RAMB18E1 |    2 |        Block Memory |
| BUFG     |    2 |               Clock |
| MUXF8    |    1 |               MuxFx |
| LUT1     |    1 |                 LUT |
+----------+------+---------------------+


## Power Report:

System working at 100 Mhz(ACLK):
  <img width="915" height="545" alt="Screenshot 2026-08-08 215700" src="https://github.com/user-attachments/assets/a98ffc59-d176-472e-bbf6-796a2f91bc1c" />

System working at 265.74 Mhz(ACLK):
  <img width="1013" height="484" alt="Screenshot 2026-08-08 221320" src="https://github.com/user-attachments/assets/303e89e8-cd08-4dc4-b005-d501409ec47e" />

