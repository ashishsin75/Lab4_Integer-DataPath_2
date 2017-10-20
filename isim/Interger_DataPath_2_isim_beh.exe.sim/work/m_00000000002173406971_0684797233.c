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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/ashis/Dropbox/Computer Engineering CSULB/CECS440/LAB 5 Ashish & J/Lab4_Integer DataPath_2/ALU_32.v";
static unsigned int ng1[] = {30U, 0U};
static unsigned int ng2[] = {31U, 0U};
static unsigned int ng3[] = {0U, 0U, 0U, 0U};
static unsigned int ng4[] = {1U, 0U};
static unsigned int ng5[] = {0U, 0U};
static unsigned int ng6[] = {3U, 0U};
static unsigned int ng7[] = {5U, 0U};



static void Always_51_0(char *t0)
{
    char t7[24];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t8;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;

LAB0:    t1 = (t0 + 6112U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 6928);
    *((int *)t2) = 1;
    t3 = (t0 + 6144);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(51, ng0);

LAB5:    xsi_set_current_line(52, ng0);
    t4 = (t0 + 1592U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t4, 5);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 5);
    if (t6 == 1)
        goto LAB9;

LAB10:
LAB12:
LAB11:    xsi_set_current_line(56, ng0);

LAB14:    xsi_set_current_line(57, ng0);
    t2 = (t0 + 3032U);
    t3 = *((char **)t2);
    t2 = (t0 + 2872U);
    t4 = *((char **)t2);
    t2 = (t0 + 3992U);
    t8 = *((char **)t2);
    t2 = (t0 + 3512U);
    t9 = *((char **)t2);
    xsi_vlogtype_concat(t7, 66, 66, 4U, t9, 1, t8, 1, t4, 32, t3, 32);
    t2 = (t0 + 4712);
    xsi_vlogvar_assign_value(t2, t7, 0, 0, 32);
    t10 = (t0 + 4552);
    xsi_vlogvar_assign_value(t10, t7, 32, 0, 32);
    t11 = (t0 + 5192);
    xsi_vlogvar_assign_value(t11, t7, 64, 0, 1);
    t12 = (t0 + 5032);
    xsi_vlogvar_assign_value(t12, t7, 65, 0, 1);

LAB13:    goto LAB2;

LAB7:    xsi_set_current_line(53, ng0);
    t8 = (t0 + 2712U);
    t9 = *((char **)t8);
    t8 = (t0 + 2552U);
    t10 = *((char **)t8);
    t8 = (t0 + 3832U);
    t11 = *((char **)t8);
    t8 = (t0 + 3352U);
    t12 = *((char **)t8);
    xsi_vlogtype_concat(t7, 66, 66, 4U, t12, 1, t11, 1, t10, 32, t9, 32);
    t8 = (t0 + 4712);
    xsi_vlogvar_assign_value(t8, t7, 0, 0, 32);
    t13 = (t0 + 4552);
    xsi_vlogvar_assign_value(t13, t7, 32, 0, 32);
    t14 = (t0 + 5192);
    xsi_vlogvar_assign_value(t14, t7, 64, 0, 1);
    t15 = (t0 + 5032);
    xsi_vlogvar_assign_value(t15, t7, 65, 0, 1);
    goto LAB13;

LAB9:    xsi_set_current_line(55, ng0);
    t3 = (t0 + 2392U);
    t4 = *((char **)t3);
    t3 = (t0 + 2232U);
    t8 = *((char **)t3);
    t3 = (t0 + 3672U);
    t9 = *((char **)t3);
    t3 = (t0 + 3192U);
    t10 = *((char **)t3);
    xsi_vlogtype_concat(t7, 66, 66, 4U, t10, 1, t9, 1, t8, 32, t4, 32);
    t3 = (t0 + 4712);
    xsi_vlogvar_assign_value(t3, t7, 0, 0, 32);
    t11 = (t0 + 4552);
    xsi_vlogvar_assign_value(t11, t7, 32, 0, 32);
    t12 = (t0 + 5192);
    xsi_vlogvar_assign_value(t12, t7, 64, 0, 1);
    t13 = (t0 + 5032);
    xsi_vlogvar_assign_value(t13, t7, 65, 0, 1);
    goto LAB13;

}

static void Cont_64_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t39[8];
    char t40[8];
    char t41[16];
    char t48[16];
    char *t1;
    char *t2;
    char *t5;
    char *t7;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    unsigned int t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;
    char *t49;
    unsigned int t50;
    unsigned int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    char *t55;
    char *t56;
    unsigned int t57;
    unsigned int t58;
    unsigned int t59;
    char *t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    unsigned int t64;
    char *t65;
    char *t66;
    char *t67;
    char *t68;
    char *t69;
    char *t70;
    unsigned int t71;
    unsigned int t72;
    char *t73;
    unsigned int t74;
    unsigned int t75;
    char *t76;
    unsigned int t77;
    unsigned int t78;
    char *t79;

LAB0:    t1 = (t0 + 6360U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(64, ng0);
    t2 = (t0 + 1592U);
    t5 = *((char **)t2);
    t2 = ((char*)((ng2)));
    memset(t6, 0, 8);
    t7 = (t5 + 4);
    t8 = (t2 + 4);
    t9 = *((unsigned int *)t5);
    t10 = *((unsigned int *)t2);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t7);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t7);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t6) = 1;

LAB7:    memset(t4, 0, 8);
    t22 = (t6 + 4);
    t23 = *((unsigned int *)t22);
    t24 = (~(t23));
    t25 = *((unsigned int *)t6);
    t26 = (t25 & t24);
    t27 = (t26 & 1U);
    if (t27 != 0)
        goto LAB8;

LAB9:    if (*((unsigned int *)t22) != 0)
        goto LAB10;

LAB11:    t29 = (t4 + 4);
    t30 = *((unsigned int *)t4);
    t31 = *((unsigned int *)t29);
    t32 = (t30 || t31);
    if (t32 > 0)
        goto LAB12;

LAB13:    t35 = *((unsigned int *)t4);
    t36 = (~(t35));
    t37 = *((unsigned int *)t29);
    t38 = (t36 || t37);
    if (t38 > 0)
        goto LAB14;

LAB15:    if (*((unsigned int *)t29) > 0)
        goto LAB16;

LAB17:    if (*((unsigned int *)t4) > 0)
        goto LAB18;

LAB19:    memcpy(t3, t39, 8);

LAB20:    t66 = (t0 + 7040);
    t67 = (t66 + 56U);
    t68 = *((char **)t67);
    t69 = (t68 + 56U);
    t70 = *((char **)t69);
    memset(t70, 0, 8);
    t71 = 1U;
    t72 = t71;
    t73 = (t3 + 4);
    t74 = *((unsigned int *)t3);
    t71 = (t71 & t74);
    t75 = *((unsigned int *)t73);
    t72 = (t72 & t75);
    t76 = (t70 + 4);
    t77 = *((unsigned int *)t70);
    *((unsigned int *)t70) = (t77 | t71);
    t78 = *((unsigned int *)t76);
    *((unsigned int *)t76) = (t78 | t72);
    xsi_driver_vfirst_trans(t66, 0, 0);
    t79 = (t0 + 6944);
    *((int *)t79) = 1;

LAB1:    return;
LAB6:    t21 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

LAB8:    *((unsigned int *)t4) = 1;
    goto LAB11;

LAB10:    t28 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB11;

LAB12:    t33 = (t0 + 4152U);
    t34 = *((char **)t33);
    goto LAB13;

LAB14:    t33 = (t0 + 4712);
    t42 = (t33 + 56U);
    t43 = *((char **)t42);
    t44 = (t0 + 4552);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    xsi_vlogtype_concat(t41, 64, 64, 2U, t46, 32, t43, 32);
    t47 = ((char*)((ng3)));
    xsi_vlog_unsigned_equal(t48, 64, t41, 64, t47, 64);
    memset(t40, 0, 8);
    t49 = (t48 + 4);
    t50 = *((unsigned int *)t49);
    t51 = (~(t50));
    t52 = *((unsigned int *)t48);
    t53 = (t52 & t51);
    t54 = (t53 & 1U);
    if (t54 != 0)
        goto LAB21;

LAB22:    if (*((unsigned int *)t49) != 0)
        goto LAB23;

LAB24:    t56 = (t40 + 4);
    t57 = *((unsigned int *)t40);
    t58 = *((unsigned int *)t56);
    t59 = (t57 || t58);
    if (t59 > 0)
        goto LAB25;

LAB26:    t61 = *((unsigned int *)t40);
    t62 = (~(t61));
    t63 = *((unsigned int *)t56);
    t64 = (t62 || t63);
    if (t64 > 0)
        goto LAB27;

LAB28:    if (*((unsigned int *)t56) > 0)
        goto LAB29;

LAB30:    if (*((unsigned int *)t40) > 0)
        goto LAB31;

LAB32:    memcpy(t39, t65, 8);

LAB33:    goto LAB15;

LAB16:    xsi_vlog_unsigned_bit_combine(t3, 1, t34, 1, t39, 1);
    goto LAB20;

LAB18:    memcpy(t3, t34, 8);
    goto LAB20;

LAB21:    *((unsigned int *)t40) = 1;
    goto LAB24;

LAB23:    t55 = (t40 + 4);
    *((unsigned int *)t40) = 1;
    *((unsigned int *)t55) = 1;
    goto LAB24;

LAB25:    t60 = ((char*)((ng4)));
    goto LAB26;

LAB27:    t65 = ((char*)((ng5)));
    goto LAB28;

LAB29:    xsi_vlog_unsigned_bit_combine(t39, 1, t60, 1, t65, 1);
    goto LAB33;

LAB31:    memcpy(t39, t60, 8);
    goto LAB33;

}

static void Always_68_2(char *t0)
{
    char t9[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    int t6;
    char *t7;
    char *t8;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;

LAB0:    t1 = (t0 + 6608U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 6960);
    *((int *)t2) = 1;
    t3 = (t0 + 6640);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(68, ng0);

LAB5:    xsi_set_current_line(69, ng0);
    t4 = (t0 + 1592U);
    t5 = *((char **)t4);

LAB6:    t4 = ((char*)((ng1)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t4, 5);
    if (t6 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng2)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 5);
    if (t6 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 5);
    if (t6 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng7)));
    t6 = xsi_vlog_unsigned_case_compare(t5, 5, t2, 5);
    if (t6 == 1)
        goto LAB13;

LAB14:
LAB16:
LAB15:    xsi_set_current_line(78, ng0);
    t2 = (t0 + 3032U);
    t3 = *((char **)t2);
    memset(t9, 0, 8);
    t2 = (t9 + 4);
    t4 = (t3 + 4);
    t11 = *((unsigned int *)t3);
    t12 = (t11 >> 31);
    t13 = (t12 & 1);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t4);
    t15 = (t14 >> 31);
    t16 = (t15 & 1);
    *((unsigned int *)t2) = t16;
    t7 = (t0 + 4872);
    xsi_vlogvar_assign_value(t7, t9, 0, 0, 1);

LAB17:    goto LAB2;

LAB7:    xsi_set_current_line(71, ng0);
    t7 = (t0 + 2552U);
    t8 = *((char **)t7);
    memset(t9, 0, 8);
    t7 = (t9 + 4);
    t10 = (t8 + 4);
    t11 = *((unsigned int *)t8);
    t12 = (t11 >> 31);
    t13 = (t12 & 1);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t10);
    t15 = (t14 >> 31);
    t16 = (t15 & 1);
    *((unsigned int *)t7) = t16;
    t17 = (t0 + 4872);
    xsi_vlogvar_assign_value(t17, t9, 0, 0, 1);
    goto LAB17;

LAB9:    xsi_set_current_line(73, ng0);
    t3 = (t0 + 2392U);
    t4 = *((char **)t3);
    memset(t9, 0, 8);
    t3 = (t9 + 4);
    t7 = (t4 + 4);
    t11 = *((unsigned int *)t4);
    t12 = (t11 >> 31);
    t13 = (t12 & 1);
    *((unsigned int *)t9) = t13;
    t14 = *((unsigned int *)t7);
    t15 = (t14 >> 31);
    t16 = (t15 & 1);
    *((unsigned int *)t3) = t16;
    t8 = (t0 + 4872);
    xsi_vlogvar_assign_value(t8, t9, 0, 0, 1);
    goto LAB17;

LAB11:    xsi_set_current_line(75, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 4872);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    goto LAB17;

LAB13:    xsi_set_current_line(77, ng0);
    t3 = ((char*)((ng5)));
    t4 = (t0 + 4872);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 1);
    goto LAB17;

}


extern void work_m_00000000002173406971_0684797233_init()
{
	static char *pe[] = {(void *)Always_51_0,(void *)Cont_64_1,(void *)Always_68_2};
	xsi_register_didat("work_m_00000000002173406971_0684797233", "isim/Interger_DataPath_2_isim_beh.exe.sim/work/m_00000000002173406971_0684797233.didat");
	xsi_register_executes(pe);
}
