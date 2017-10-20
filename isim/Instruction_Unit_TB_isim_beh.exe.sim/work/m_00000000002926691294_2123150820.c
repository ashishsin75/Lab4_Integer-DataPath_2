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
static const char *ng0 = "C:/Users/ashis/Dropbox/Computer Engineering CSULB/CECS440/LAB 5 Ashish & J/Lab4_Integer DataPath_2/Instruction_Memory.v";
static unsigned int ng1[] = {1U, 0U};
static unsigned int ng2[] = {2U, 0U};
static unsigned int ng3[] = {3U, 0U};
static unsigned int ng4[] = {0U, 4294967295U};



static void Always_33_0(char *t0)
{
    char t6[8];
    char t19[8];
    char t26[8];
    char t64[8];
    char t75[8];
    char t76[8];
    char t83[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t65;
    char *t66;
    char *t67;
    unsigned int t68;
    unsigned int t69;
    unsigned int t70;
    unsigned int t71;
    unsigned int t72;
    unsigned int t73;
    char *t74;
    char *t77;
    char *t78;
    char *t79;
    char *t80;
    char *t81;
    char *t82;
    char *t84;
    char *t85;
    char *t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    unsigned int t90;
    unsigned int t91;
    unsigned int t92;
    char *t93;
    unsigned int t94;
    int t95;
    char *t96;
    unsigned int t97;
    int t98;
    int t99;
    unsigned int t100;
    unsigned int t101;
    int t102;
    int t103;

LAB0:    t1 = (t0 + 3328U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(33, ng0);
    t2 = (t0 + 3896);
    *((int *)t2) = 1;
    t3 = (t0 + 3360);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(33, ng0);

LAB5:    xsi_set_current_line(34, ng0);
    t4 = (t0 + 1208U);
    t5 = *((char **)t4);
    memset(t6, 0, 8);
    t4 = (t5 + 4);
    t7 = *((unsigned int *)t4);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB6;

LAB7:    if (*((unsigned int *)t4) != 0)
        goto LAB8;

LAB9:    t13 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t13);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB10;

LAB11:    memcpy(t26, t6, 8);

LAB12:    t58 = (t26 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t26);
    t62 = (t61 & t60);
    t63 = (t62 != 0);
    if (t63 > 0)
        goto LAB20;

LAB21:
LAB22:    goto LAB2;

LAB6:    *((unsigned int *)t6) = 1;
    goto LAB9;

LAB8:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB9;

LAB10:    t17 = (t0 + 1368U);
    t18 = *((char **)t17);
    memset(t19, 0, 8);
    t17 = (t18 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (~(t20));
    t22 = *((unsigned int *)t18);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB13;

LAB14:    if (*((unsigned int *)t17) != 0)
        goto LAB15;

LAB16:    t27 = *((unsigned int *)t6);
    t28 = *((unsigned int *)t19);
    t29 = (t27 & t28);
    *((unsigned int *)t26) = t29;
    t30 = (t6 + 4);
    t31 = (t19 + 4);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t30);
    t34 = *((unsigned int *)t31);
    t35 = (t33 | t34);
    *((unsigned int *)t32) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 != 0);
    if (t37 == 1)
        goto LAB17;

LAB18:
LAB19:    goto LAB12;

LAB13:    *((unsigned int *)t19) = 1;
    goto LAB16;

LAB15:    t25 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB16;

LAB17:    t38 = *((unsigned int *)t26);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t26) = (t38 | t39);
    t40 = (t6 + 4);
    t41 = (t19 + 4);
    t42 = *((unsigned int *)t6);
    t43 = (~(t42));
    t44 = *((unsigned int *)t40);
    t45 = (~(t44));
    t46 = *((unsigned int *)t19);
    t47 = (~(t46));
    t48 = *((unsigned int *)t41);
    t49 = (~(t48));
    t50 = (t43 & t45);
    t51 = (t47 & t49);
    t52 = (~(t50));
    t53 = (~(t51));
    t54 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t54 & t52);
    t55 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t55 & t53);
    t56 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t56 & t52);
    t57 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t57 & t53);
    goto LAB19;

LAB20:    xsi_set_current_line(34, ng0);

LAB23:    xsi_set_current_line(35, ng0);
    t65 = (t0 + 1848U);
    t66 = *((char **)t65);
    memset(t64, 0, 8);
    t65 = (t64 + 4);
    t67 = (t66 + 4);
    t68 = *((unsigned int *)t66);
    t69 = (t68 >> 24);
    *((unsigned int *)t64) = t69;
    t70 = *((unsigned int *)t67);
    t71 = (t70 >> 24);
    *((unsigned int *)t65) = t71;
    t72 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t72 & 255U);
    t73 = *((unsigned int *)t65);
    *((unsigned int *)t65) = (t73 & 255U);
    t74 = (t0 + 2408);
    t77 = (t0 + 2408);
    t78 = (t77 + 72U);
    t79 = *((char **)t78);
    t80 = (t0 + 2408);
    t81 = (t80 + 64U);
    t82 = *((char **)t81);
    t84 = (t0 + 1688U);
    t85 = *((char **)t84);
    memset(t83, 0, 8);
    t84 = (t83 + 4);
    t86 = (t85 + 4);
    t87 = *((unsigned int *)t85);
    t88 = (t87 >> 0);
    *((unsigned int *)t83) = t88;
    t89 = *((unsigned int *)t86);
    t90 = (t89 >> 0);
    *((unsigned int *)t84) = t90;
    t91 = *((unsigned int *)t83);
    *((unsigned int *)t83) = (t91 & 4095U);
    t92 = *((unsigned int *)t84);
    *((unsigned int *)t84) = (t92 & 4095U);
    xsi_vlog_generic_convert_array_indices(t75, t76, t79, t82, 2, 1, t83, 12, 2);
    t93 = (t75 + 4);
    t94 = *((unsigned int *)t93);
    t95 = (!(t94));
    t96 = (t76 + 4);
    t97 = *((unsigned int *)t96);
    t98 = (!(t97));
    t99 = (t95 && t98);
    if (t99 == 1)
        goto LAB24;

LAB25:    xsi_set_current_line(36, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 16);
    *((unsigned int *)t6) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 16);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t11 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    t5 = (t0 + 2408);
    t12 = (t0 + 2408);
    t13 = (t12 + 72U);
    t17 = *((char **)t13);
    t18 = (t0 + 2408);
    t25 = (t18 + 64U);
    t30 = *((char **)t25);
    t31 = (t0 + 1688U);
    t32 = *((char **)t31);
    memset(t64, 0, 8);
    t31 = (t64 + 4);
    t40 = (t32 + 4);
    t15 = *((unsigned int *)t32);
    t16 = (t15 >> 0);
    *((unsigned int *)t64) = t16;
    t20 = *((unsigned int *)t40);
    t21 = (t20 >> 0);
    *((unsigned int *)t31) = t21;
    t22 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t22 & 4095U);
    t23 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t23 & 4095U);
    t41 = ((char*)((ng1)));
    memset(t75, 0, 8);
    xsi_vlog_unsigned_add(t75, 12, t64, 12, t41, 12);
    xsi_vlog_generic_convert_array_indices(t19, t26, t17, t30, 2, 1, t75, 12, 2);
    t58 = (t19 + 4);
    t24 = *((unsigned int *)t58);
    t50 = (!(t24));
    t65 = (t26 + 4);
    t27 = *((unsigned int *)t65);
    t51 = (!(t27));
    t95 = (t50 && t51);
    if (t95 == 1)
        goto LAB26;

LAB27:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 8);
    *((unsigned int *)t6) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 8);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t11 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    t5 = (t0 + 2408);
    t12 = (t0 + 2408);
    t13 = (t12 + 72U);
    t17 = *((char **)t13);
    t18 = (t0 + 2408);
    t25 = (t18 + 64U);
    t30 = *((char **)t25);
    t31 = (t0 + 1688U);
    t32 = *((char **)t31);
    memset(t64, 0, 8);
    t31 = (t64 + 4);
    t40 = (t32 + 4);
    t15 = *((unsigned int *)t32);
    t16 = (t15 >> 0);
    *((unsigned int *)t64) = t16;
    t20 = *((unsigned int *)t40);
    t21 = (t20 >> 0);
    *((unsigned int *)t31) = t21;
    t22 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t22 & 4095U);
    t23 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t23 & 4095U);
    t41 = ((char*)((ng2)));
    memset(t75, 0, 8);
    xsi_vlog_unsigned_add(t75, 12, t64, 12, t41, 12);
    xsi_vlog_generic_convert_array_indices(t19, t26, t17, t30, 2, 1, t75, 12, 2);
    t58 = (t19 + 4);
    t24 = *((unsigned int *)t58);
    t50 = (!(t24));
    t65 = (t26 + 4);
    t27 = *((unsigned int *)t65);
    t51 = (!(t27));
    t95 = (t50 && t51);
    if (t95 == 1)
        goto LAB28;

LAB29:    xsi_set_current_line(38, ng0);
    t2 = (t0 + 1848U);
    t3 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t6 + 4);
    t4 = (t3 + 4);
    t7 = *((unsigned int *)t3);
    t8 = (t7 >> 0);
    *((unsigned int *)t6) = t8;
    t9 = *((unsigned int *)t4);
    t10 = (t9 >> 0);
    *((unsigned int *)t2) = t10;
    t11 = *((unsigned int *)t6);
    *((unsigned int *)t6) = (t11 & 255U);
    t14 = *((unsigned int *)t2);
    *((unsigned int *)t2) = (t14 & 255U);
    t5 = (t0 + 2408);
    t12 = (t0 + 2408);
    t13 = (t12 + 72U);
    t17 = *((char **)t13);
    t18 = (t0 + 2408);
    t25 = (t18 + 64U);
    t30 = *((char **)t25);
    t31 = (t0 + 1688U);
    t32 = *((char **)t31);
    memset(t64, 0, 8);
    t31 = (t64 + 4);
    t40 = (t32 + 4);
    t15 = *((unsigned int *)t32);
    t16 = (t15 >> 0);
    *((unsigned int *)t64) = t16;
    t20 = *((unsigned int *)t40);
    t21 = (t20 >> 0);
    *((unsigned int *)t31) = t21;
    t22 = *((unsigned int *)t64);
    *((unsigned int *)t64) = (t22 & 4095U);
    t23 = *((unsigned int *)t31);
    *((unsigned int *)t31) = (t23 & 4095U);
    t41 = ((char*)((ng3)));
    memset(t75, 0, 8);
    xsi_vlog_unsigned_add(t75, 12, t64, 12, t41, 12);
    xsi_vlog_generic_convert_array_indices(t19, t26, t17, t30, 2, 1, t75, 12, 2);
    t58 = (t19 + 4);
    t24 = *((unsigned int *)t58);
    t50 = (!(t24));
    t65 = (t26 + 4);
    t27 = *((unsigned int *)t65);
    t51 = (!(t27));
    t95 = (t50 && t51);
    if (t95 == 1)
        goto LAB30;

LAB31:    goto LAB22;

LAB24:    t100 = *((unsigned int *)t75);
    t101 = *((unsigned int *)t76);
    t102 = (t100 - t101);
    t103 = (t102 + 1);
    xsi_vlogvar_wait_assign_value(t74, t64, 0, *((unsigned int *)t76), t103, 0LL);
    goto LAB25;

LAB26:    t28 = *((unsigned int *)t19);
    t29 = *((unsigned int *)t26);
    t98 = (t28 - t29);
    t99 = (t98 + 1);
    xsi_vlogvar_wait_assign_value(t5, t6, 0, *((unsigned int *)t26), t99, 0LL);
    goto LAB27;

LAB28:    t28 = *((unsigned int *)t19);
    t29 = *((unsigned int *)t26);
    t98 = (t28 - t29);
    t99 = (t98 + 1);
    xsi_vlogvar_wait_assign_value(t5, t6, 0, *((unsigned int *)t26), t99, 0LL);
    goto LAB29;

LAB30:    t28 = *((unsigned int *)t19);
    t29 = *((unsigned int *)t26);
    t98 = (t28 - t29);
    t99 = (t98 + 1);
    xsi_vlogvar_wait_assign_value(t5, t6, 0, *((unsigned int *)t26), t99, 0LL);
    goto LAB31;

}

static void Cont_43_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t6[8];
    char t19[8];
    char t26[8];
    char t69[8];
    char t73[8];
    char t80[8];
    char t91[8];
    char t95[8];
    char t102[8];
    char t113[8];
    char t117[8];
    char t124[8];
    char t135[8];
    char t139[8];
    char t146[8];
    char *t1;
    char *t2;
    char *t5;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t17;
    char *t18;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    unsigned int t27;
    unsigned int t28;
    unsigned int t29;
    char *t30;
    char *t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    char *t40;
    char *t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    int t50;
    int t51;
    unsigned int t52;
    unsigned int t53;
    unsigned int t54;
    unsigned int t55;
    unsigned int t56;
    unsigned int t57;
    char *t58;
    unsigned int t59;
    unsigned int t60;
    unsigned int t61;
    unsigned int t62;
    unsigned int t63;
    char *t64;
    char *t65;
    unsigned int t66;
    unsigned int t67;
    unsigned int t68;
    char *t70;
    char *t71;
    char *t72;
    char *t74;
    char *t75;
    char *t76;
    char *t77;
    char *t78;
    char *t79;
    char *t81;
    char *t82;
    char *t83;
    unsigned int t84;
    unsigned int t85;
    unsigned int t86;
    unsigned int t87;
    unsigned int t88;
    unsigned int t89;
    char *t90;
    char *t92;
    char *t93;
    char *t94;
    char *t96;
    char *t97;
    char *t98;
    char *t99;
    char *t100;
    char *t101;
    char *t103;
    char *t104;
    char *t105;
    unsigned int t106;
    unsigned int t107;
    unsigned int t108;
    unsigned int t109;
    unsigned int t110;
    unsigned int t111;
    char *t112;
    char *t114;
    char *t115;
    char *t116;
    char *t118;
    char *t119;
    char *t120;
    char *t121;
    char *t122;
    char *t123;
    char *t125;
    char *t126;
    char *t127;
    unsigned int t128;
    unsigned int t129;
    unsigned int t130;
    unsigned int t131;
    unsigned int t132;
    unsigned int t133;
    char *t134;
    char *t136;
    char *t137;
    char *t138;
    char *t140;
    char *t141;
    char *t142;
    char *t143;
    char *t144;
    char *t145;
    char *t147;
    char *t148;
    char *t149;
    unsigned int t150;
    unsigned int t151;
    unsigned int t152;
    unsigned int t153;
    unsigned int t154;
    unsigned int t155;
    unsigned int t156;
    unsigned int t157;
    unsigned int t158;
    unsigned int t159;
    char *t160;
    char *t161;
    char *t162;
    char *t163;
    char *t164;
    char *t165;
    char *t166;

LAB0:    t1 = (t0 + 3576U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = (t0 + 1208U);
    t5 = *((char **)t2);
    memset(t6, 0, 8);
    t2 = (t5 + 4);
    t7 = *((unsigned int *)t2);
    t8 = (~(t7));
    t9 = *((unsigned int *)t5);
    t10 = (t9 & t8);
    t11 = (t10 & 1U);
    if (t11 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t2) != 0)
        goto LAB6;

LAB7:    t13 = (t6 + 4);
    t14 = *((unsigned int *)t6);
    t15 = *((unsigned int *)t13);
    t16 = (t14 || t15);
    if (t16 > 0)
        goto LAB8;

LAB9:    memcpy(t26, t6, 8);

LAB10:    memset(t4, 0, 8);
    t58 = (t26 + 4);
    t59 = *((unsigned int *)t58);
    t60 = (~(t59));
    t61 = *((unsigned int *)t26);
    t62 = (t61 & t60);
    t63 = (t62 & 1U);
    if (t63 != 0)
        goto LAB18;

LAB19:    if (*((unsigned int *)t58) != 0)
        goto LAB20;

LAB21:    t65 = (t4 + 4);
    t66 = *((unsigned int *)t4);
    t67 = *((unsigned int *)t65);
    t68 = (t66 || t67);
    if (t68 > 0)
        goto LAB22;

LAB23:    t156 = *((unsigned int *)t4);
    t157 = (~(t156));
    t158 = *((unsigned int *)t65);
    t159 = (t157 || t158);
    if (t159 > 0)
        goto LAB24;

LAB25:    if (*((unsigned int *)t65) > 0)
        goto LAB26;

LAB27:    if (*((unsigned int *)t4) > 0)
        goto LAB28;

LAB29:    memcpy(t3, t160, 8);

LAB30:    t161 = (t0 + 3992);
    t162 = (t161 + 56U);
    t163 = *((char **)t162);
    t164 = (t163 + 56U);
    t165 = *((char **)t164);
    memcpy(t165, t3, 8);
    xsi_driver_vfirst_trans(t161, 0, 31);
    t166 = (t0 + 3912);
    *((int *)t166) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t6) = 1;
    goto LAB7;

LAB6:    t12 = (t6 + 4);
    *((unsigned int *)t6) = 1;
    *((unsigned int *)t12) = 1;
    goto LAB7;

LAB8:    t17 = (t0 + 1528U);
    t18 = *((char **)t17);
    memset(t19, 0, 8);
    t17 = (t18 + 4);
    t20 = *((unsigned int *)t17);
    t21 = (~(t20));
    t22 = *((unsigned int *)t18);
    t23 = (t22 & t21);
    t24 = (t23 & 1U);
    if (t24 != 0)
        goto LAB11;

LAB12:    if (*((unsigned int *)t17) != 0)
        goto LAB13;

LAB14:    t27 = *((unsigned int *)t6);
    t28 = *((unsigned int *)t19);
    t29 = (t27 & t28);
    *((unsigned int *)t26) = t29;
    t30 = (t6 + 4);
    t31 = (t19 + 4);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t30);
    t34 = *((unsigned int *)t31);
    t35 = (t33 | t34);
    *((unsigned int *)t32) = t35;
    t36 = *((unsigned int *)t32);
    t37 = (t36 != 0);
    if (t37 == 1)
        goto LAB15;

LAB16:
LAB17:    goto LAB10;

LAB11:    *((unsigned int *)t19) = 1;
    goto LAB14;

LAB13:    t25 = (t19 + 4);
    *((unsigned int *)t19) = 1;
    *((unsigned int *)t25) = 1;
    goto LAB14;

LAB15:    t38 = *((unsigned int *)t26);
    t39 = *((unsigned int *)t32);
    *((unsigned int *)t26) = (t38 | t39);
    t40 = (t6 + 4);
    t41 = (t19 + 4);
    t42 = *((unsigned int *)t6);
    t43 = (~(t42));
    t44 = *((unsigned int *)t40);
    t45 = (~(t44));
    t46 = *((unsigned int *)t19);
    t47 = (~(t46));
    t48 = *((unsigned int *)t41);
    t49 = (~(t48));
    t50 = (t43 & t45);
    t51 = (t47 & t49);
    t52 = (~(t50));
    t53 = (~(t51));
    t54 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t54 & t52);
    t55 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t55 & t53);
    t56 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t56 & t52);
    t57 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t57 & t53);
    goto LAB17;

LAB18:    *((unsigned int *)t4) = 1;
    goto LAB21;

LAB20:    t64 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t64) = 1;
    goto LAB21;

LAB22:    t70 = (t0 + 2408);
    t71 = (t70 + 56U);
    t72 = *((char **)t71);
    t74 = (t0 + 2408);
    t75 = (t74 + 72U);
    t76 = *((char **)t75);
    t77 = (t0 + 2408);
    t78 = (t77 + 64U);
    t79 = *((char **)t78);
    t81 = (t0 + 1688U);
    t82 = *((char **)t81);
    memset(t80, 0, 8);
    t81 = (t80 + 4);
    t83 = (t82 + 4);
    t84 = *((unsigned int *)t82);
    t85 = (t84 >> 0);
    *((unsigned int *)t80) = t85;
    t86 = *((unsigned int *)t83);
    t87 = (t86 >> 0);
    *((unsigned int *)t81) = t87;
    t88 = *((unsigned int *)t80);
    *((unsigned int *)t80) = (t88 & 4095U);
    t89 = *((unsigned int *)t81);
    *((unsigned int *)t81) = (t89 & 4095U);
    t90 = ((char*)((ng3)));
    memset(t91, 0, 8);
    xsi_vlog_unsigned_add(t91, 12, t80, 12, t90, 12);
    xsi_vlog_generic_get_array_select_value(t73, 8, t72, t76, t79, 2, 1, t91, 12, 2);
    t92 = (t0 + 2408);
    t93 = (t92 + 56U);
    t94 = *((char **)t93);
    t96 = (t0 + 2408);
    t97 = (t96 + 72U);
    t98 = *((char **)t97);
    t99 = (t0 + 2408);
    t100 = (t99 + 64U);
    t101 = *((char **)t100);
    t103 = (t0 + 1688U);
    t104 = *((char **)t103);
    memset(t102, 0, 8);
    t103 = (t102 + 4);
    t105 = (t104 + 4);
    t106 = *((unsigned int *)t104);
    t107 = (t106 >> 0);
    *((unsigned int *)t102) = t107;
    t108 = *((unsigned int *)t105);
    t109 = (t108 >> 0);
    *((unsigned int *)t103) = t109;
    t110 = *((unsigned int *)t102);
    *((unsigned int *)t102) = (t110 & 4095U);
    t111 = *((unsigned int *)t103);
    *((unsigned int *)t103) = (t111 & 4095U);
    t112 = ((char*)((ng2)));
    memset(t113, 0, 8);
    xsi_vlog_unsigned_add(t113, 12, t102, 12, t112, 12);
    xsi_vlog_generic_get_array_select_value(t95, 8, t94, t98, t101, 2, 1, t113, 12, 2);
    t114 = (t0 + 2408);
    t115 = (t114 + 56U);
    t116 = *((char **)t115);
    t118 = (t0 + 2408);
    t119 = (t118 + 72U);
    t120 = *((char **)t119);
    t121 = (t0 + 2408);
    t122 = (t121 + 64U);
    t123 = *((char **)t122);
    t125 = (t0 + 1688U);
    t126 = *((char **)t125);
    memset(t124, 0, 8);
    t125 = (t124 + 4);
    t127 = (t126 + 4);
    t128 = *((unsigned int *)t126);
    t129 = (t128 >> 0);
    *((unsigned int *)t124) = t129;
    t130 = *((unsigned int *)t127);
    t131 = (t130 >> 0);
    *((unsigned int *)t125) = t131;
    t132 = *((unsigned int *)t124);
    *((unsigned int *)t124) = (t132 & 4095U);
    t133 = *((unsigned int *)t125);
    *((unsigned int *)t125) = (t133 & 4095U);
    t134 = ((char*)((ng1)));
    memset(t135, 0, 8);
    xsi_vlog_unsigned_add(t135, 12, t124, 12, t134, 12);
    xsi_vlog_generic_get_array_select_value(t117, 8, t116, t120, t123, 2, 1, t135, 12, 2);
    t136 = (t0 + 2408);
    t137 = (t136 + 56U);
    t138 = *((char **)t137);
    t140 = (t0 + 2408);
    t141 = (t140 + 72U);
    t142 = *((char **)t141);
    t143 = (t0 + 2408);
    t144 = (t143 + 64U);
    t145 = *((char **)t144);
    t147 = (t0 + 1688U);
    t148 = *((char **)t147);
    memset(t146, 0, 8);
    t147 = (t146 + 4);
    t149 = (t148 + 4);
    t150 = *((unsigned int *)t148);
    t151 = (t150 >> 0);
    *((unsigned int *)t146) = t151;
    t152 = *((unsigned int *)t149);
    t153 = (t152 >> 0);
    *((unsigned int *)t147) = t153;
    t154 = *((unsigned int *)t146);
    *((unsigned int *)t146) = (t154 & 4095U);
    t155 = *((unsigned int *)t147);
    *((unsigned int *)t147) = (t155 & 4095U);
    xsi_vlog_generic_get_array_select_value(t139, 8, t138, t142, t145, 2, 1, t146, 12, 2);
    xsi_vlogtype_concat(t69, 32, 32, 4U, t139, 8, t117, 8, t95, 8, t73, 8);
    goto LAB23;

LAB24:    t160 = ((char*)((ng4)));
    goto LAB25;

LAB26:    xsi_vlog_unsigned_bit_combine(t3, 32, t69, 32, t160, 32);
    goto LAB30;

LAB28:    memcpy(t3, t69, 8);
    goto LAB30;

}


extern void work_m_00000000002926691294_2123150820_init()
{
	static char *pe[] = {(void *)Always_33_0,(void *)Cont_43_1};
	xsi_register_didat("work_m_00000000002926691294_2123150820", "isim/Instruction_Unit_TB_isim_beh.exe.sim/work/m_00000000002926691294_2123150820.didat");
	xsi_register_executes(pe);
}
