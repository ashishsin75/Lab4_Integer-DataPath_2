/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000000665705945_1752074898_init();
    work_m_00000000003178984612_2966759537_init();
    work_m_00000000001707910843_2722733084_init();
    work_m_00000000002465587950_1926972201_init();
    work_m_00000000002173406971_0684797233_init();
    work_m_00000000004111036268_3625959414_init();
    work_m_00000000002513498712_1124448613_init();
    work_m_00000000002570815587_2064508069_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000002570815587_2064508069");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
