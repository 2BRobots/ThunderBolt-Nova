#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-default.mk)" "nbproject/Makefile-local-default.mk"
include nbproject/Makefile-local-default.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=default
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=cof
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Thunder_Bolt_Blinker_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=cof
FINAL_IMAGE=dist/${CND_CONF}/${IMAGE_TYPE}/Thunder_Bolt_Blinker_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../pic18_c_template_1.X/configuration_bits.c ../pic18_c_template_1.X/interrupts.c ../pic18_c_template_1.X/main.c ../pic18_c_template_1.X/system.c ../pic18_c_template_1.X/user.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/1228225711/configuration_bits.o ${OBJECTDIR}/_ext/1228225711/interrupts.o ${OBJECTDIR}/_ext/1228225711/main.o ${OBJECTDIR}/_ext/1228225711/system.o ${OBJECTDIR}/_ext/1228225711/user.o
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/1228225711/configuration_bits.o.d ${OBJECTDIR}/_ext/1228225711/interrupts.o.d ${OBJECTDIR}/_ext/1228225711/main.o.d ${OBJECTDIR}/_ext/1228225711/system.o.d ${OBJECTDIR}/_ext/1228225711/user.o.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/1228225711/configuration_bits.o ${OBJECTDIR}/_ext/1228225711/interrupts.o ${OBJECTDIR}/_ext/1228225711/main.o ${OBJECTDIR}/_ext/1228225711/system.o ${OBJECTDIR}/_ext/1228225711/user.o

# Source Files
SOURCEFILES=../pic18_c_template_1.X/configuration_bits.c ../pic18_c_template_1.X/interrupts.c ../pic18_c_template_1.X/main.c ../pic18_c_template_1.X/system.c ../pic18_c_template_1.X/user.c


CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-default.mk dist/${CND_CONF}/${IMAGE_TYPE}/Thunder_Bolt_Blinker_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F14K50
MP_PROCESSOR_OPTION_LD=18f14k50
MP_LINKER_DEBUG_OPTION=  -u_DEBUGSTACK
# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/1228225711/configuration_bits.o: ../pic18_c_template_1.X/configuration_bits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1228225711" 
	@${RM} ${OBJECTDIR}/_ext/1228225711/configuration_bits.o.d 
	@${RM} ${OBJECTDIR}/_ext/1228225711/configuration_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1228225711/configuration_bits.o   ../pic18_c_template_1.X/configuration_bits.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1228225711/configuration_bits.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228225711/configuration_bits.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1228225711/interrupts.o: ../pic18_c_template_1.X/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1228225711" 
	@${RM} ${OBJECTDIR}/_ext/1228225711/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1228225711/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1228225711/interrupts.o   ../pic18_c_template_1.X/interrupts.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1228225711/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228225711/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1228225711/main.o: ../pic18_c_template_1.X/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1228225711" 
	@${RM} ${OBJECTDIR}/_ext/1228225711/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1228225711/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1228225711/main.o   ../pic18_c_template_1.X/main.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1228225711/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228225711/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1228225711/system.o: ../pic18_c_template_1.X/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1228225711" 
	@${RM} ${OBJECTDIR}/_ext/1228225711/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1228225711/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1228225711/system.o   ../pic18_c_template_1.X/system.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1228225711/system.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228225711/system.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1228225711/user.o: ../pic18_c_template_1.X/user.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1228225711" 
	@${RM} ${OBJECTDIR}/_ext/1228225711/user.o.d 
	@${RM} ${OBJECTDIR}/_ext/1228225711/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -D__DEBUG -D__MPLAB_DEBUGGER_SIMULATOR=1 -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1228225711/user.o   ../pic18_c_template_1.X/user.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1228225711/user.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228225711/user.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
else
${OBJECTDIR}/_ext/1228225711/configuration_bits.o: ../pic18_c_template_1.X/configuration_bits.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1228225711" 
	@${RM} ${OBJECTDIR}/_ext/1228225711/configuration_bits.o.d 
	@${RM} ${OBJECTDIR}/_ext/1228225711/configuration_bits.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1228225711/configuration_bits.o   ../pic18_c_template_1.X/configuration_bits.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1228225711/configuration_bits.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228225711/configuration_bits.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1228225711/interrupts.o: ../pic18_c_template_1.X/interrupts.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1228225711" 
	@${RM} ${OBJECTDIR}/_ext/1228225711/interrupts.o.d 
	@${RM} ${OBJECTDIR}/_ext/1228225711/interrupts.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1228225711/interrupts.o   ../pic18_c_template_1.X/interrupts.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1228225711/interrupts.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228225711/interrupts.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1228225711/main.o: ../pic18_c_template_1.X/main.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1228225711" 
	@${RM} ${OBJECTDIR}/_ext/1228225711/main.o.d 
	@${RM} ${OBJECTDIR}/_ext/1228225711/main.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1228225711/main.o   ../pic18_c_template_1.X/main.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1228225711/main.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228225711/main.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1228225711/system.o: ../pic18_c_template_1.X/system.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1228225711" 
	@${RM} ${OBJECTDIR}/_ext/1228225711/system.o.d 
	@${RM} ${OBJECTDIR}/_ext/1228225711/system.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1228225711/system.o   ../pic18_c_template_1.X/system.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1228225711/system.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228225711/system.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
${OBJECTDIR}/_ext/1228225711/user.o: ../pic18_c_template_1.X/user.c  nbproject/Makefile-${CND_CONF}.mk
	@${MKDIR} "${OBJECTDIR}/_ext/1228225711" 
	@${RM} ${OBJECTDIR}/_ext/1228225711/user.o.d 
	@${RM} ${OBJECTDIR}/_ext/1228225711/user.o 
	${MP_CC} $(MP_EXTRA_CC_PRE) -p$(MP_PROCESSOR_OPTION) -ms -oa-  -I ${MP_CC_DIR}\\..\\h  -fo ${OBJECTDIR}/_ext/1228225711/user.o   ../pic18_c_template_1.X/user.c 
	@${DEP_GEN} -d ${OBJECTDIR}/_ext/1228225711/user.o 
	@${FIXDEPS} "${OBJECTDIR}/_ext/1228225711/user.o.d" $(SILENT) -rsi ${MP_CC_DIR}../ -c18 
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
dist/${CND_CONF}/${IMAGE_TYPE}/Thunder_Bolt_Blinker_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    ../pic18_c_template_1.X/18f14k50_g.lkr
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) "..\pic18_c_template_1.X\18f14k50_g.lkr"  -p$(MP_PROCESSOR_OPTION_LD)  -w -x -u_DEBUG -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"  -z__MPLAB_BUILD=1  -u_CRUNTIME -z__MPLAB_DEBUG=1 -z__MPLAB_DEBUGGER_SIMULATOR=1 $(MP_LINKER_DEBUG_OPTION) -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/Thunder_Bolt_Blinker_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
else
dist/${CND_CONF}/${IMAGE_TYPE}/Thunder_Bolt_Blinker_template.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   ../pic18_c_template_1.X/18f14k50_g.lkr
	@${MKDIR} dist/${CND_CONF}/${IMAGE_TYPE} 
	${MP_LD} $(MP_EXTRA_LD_PRE) "..\pic18_c_template_1.X\18f14k50_g.lkr"  -p$(MP_PROCESSOR_OPTION_LD)  -w  -m"${DISTDIR}/${PROJECTNAME}.${IMAGE_TYPE}.map"  -z__MPLAB_BUILD=1  -u_CRUNTIME -l ${MP_CC_DIR}\\..\\lib  -o dist/${CND_CONF}/${IMAGE_TYPE}/Thunder_Bolt_Blinker_template.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}   
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r build/default
	${RM} -r dist/default

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(shell mplabwildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
