/*
 * Modelo de equilibrio general dinámico Fedesarrollo
 *

//***************************************************************
// Definición de variables endógenas
//***************************************************************
var
//Para cambios de endogeno en las variables de productividad ver pg. 58 del documento
    BC_t                ${BC_t}$                (long_name='Balanza comercial')
    B_gt                ${B_gt}$                (long_name='Oferta de bonos domésticos del gobierno')
    B_pt                ${B_pt}$                (long_name='Demanda de bonos del gobierno del sector privado')
//Revisar B_t_o y CC_t
    B_t_o               ${B_t_o}$               (long_name='Demanda de bonos domésticos de la familia Ricardiana')
    CC_t                ${CC_t}$                (long_name='Cuenta corriente*')
//Para CM_it se deben agregar más adelante dos variables donde se igualen con el precio, ver pg 27.
    CM_1t               ${CM_1t}$               (long_name='Costo marginal de minoristas del sector 1')
    CM_2t               ${CM_2t}$               (long_name='Costo marginal de minoristas del sector 2')
//C_pt debe empalmarse con la ecuación de la pg. 57
    C_pt                ${C_pt}$                (long_name='Gasto de consumo real del sector privado')
    C_t_NO              ${C_t_NO}$              (long_name='Gasto de consumo real de la familia no-Ricardiana')
    C_t_O               ${C_t_O}$               (long_name='Gasto de consumo real de la familia Ricardiana') 
    D_ct                ${D_ct}$                (long_name='Insumo de bien doméstico en producción del bien de consumo')
    D_it                ${D_it}$                (long_name='Insumo de bien doméstico en producción del bien de inversión')
    D_gt_as             ${D_gt_as}$             (long_name='Deuda externa del gobierno')
    D_pt_as             ${D_pt_as}$             (long_name='Deuda externa del sector privado')
//Revisar D_t_asO
    D_t_asO              ${D_t_asO}$            (long_name='Deuda externa de la familia Ricardiana')
    E_t                 ${E_t}$                 (long_name='Exportaciones reales totales')
    E_Ct                ${E_Ct}$                (long_name='Exportaciones reales del bien de consumo')
    E_t_oil             ${E_t_oil}$             (long_name='Exportaciones petroleras')
    F_t                 ${F_t}$                 (long_name='Necesidades nominales de financiación del gobierno')
    gamma_pibt          ${gamma_pibt}$          (long_name='Tasa bruta de crecimiento del PIB real')
    G_t                 ${G_t}$                 (long_name='Gasto corriente real del gobierno')
    g_Ct                ${g_Ct}$                (long_name='Gasto corriente del gobierno como % del PIB nominal')
    h_1t                ${h_1t}$                (long_name='Oferta total de trabajo en sector 1')
    h_2t                ${h_2t}$                (long_name='Oferta total de trabajo en sector 2')
    h_3t                ${h_3t}$                (long_name='Oferta total de trabajo en sector 3')
    h_1t_NO             ${h_1t_NO}$             (long_name='Oferta de trabajo de la familia no Ricardiana en sector 1')
    h_2t_NO             ${h_2t_NO}$             (long_name='Oferta de trabajo de la familia no Ricardiana en sector 2')
    h_3t_NO             ${h_3t_NO}$             (long_name='Oferta de trabajo de la familia no Ricardiana en sector 3')
    h_1t_O              ${h_1t_O}$              (long_name='Oferta de trabajo de la familia Ricardiana en sector 1')
    h_2t_O              ${h_2t_O}$              (long_name='Oferta de trabajo de la familia Ricardiana en sector 2')
    h_3t_O              ${h_3t_O}$              (long_name='Oferta de trabajo de la familia Ricardiana en sector 3')
//Para II_gt II_mt revisar pg. 41
    II_gt               ${II_gt}$               (long_name='Función Indicador para cambio de régimen de gasto público')
    II_mt               ${II_mt}$               (long_name='Función Indicador para cambio de régimen de política monetaria')
    I_gt                ${I_gt}$                (long_name='Inversión real de gobierno en infraestructura')
    I_1t                ${I_1t}$                (long_name='Inversión privada en capital del sector 1')
    I_2t                ${I_2t}$                (long_name='Inversión privada en capital del sector 2')
    I_3t                ${I_3t}$                (long_name='Inversión privada en capital del sector 3')
    I_1t_O              ${I_1t_O}$              (long_name='Inversión de capital en sector 1 de la familia Ricardiana')
    I_2t_O              ${I_2t_O}$              (long_name='Inversión de capital en sector 2 de la familia Ricardiana')
    I_3t_O              ${I_3t_O}$              (long_name='Inversión de capital en sector 3 de la familia Ricardiana')
//Empalmar I_pt con ecuación pg. 59
    I_pt                ${I_pt}$                (long_name='Inversión real privada')
    KK_t                ${KK_t}$                (long_name='Acervo efectivo de infraestructura')
    K_gt                ${K_gt}$                (long_name='Stock de infraestructura pública instalada')
//Empalmar K_it con ecuación pg. 37 [68]
    K_1t                ${K_1t}$                (long_name='Capital privado instalado en sector 1')
    K_2t                ${K_2t}$                (long_name='Capital privado instalado en sector 2')
    K_3t                ${K_3t}$                (long_name='Capital privado instalado en sector 3')
    K_1t_O    		${K_1t_O}$ 		(long_name='Stock de capital de la familia ricardiana en el sector 1')
    K_2t_O    		${K_2t_O}$ 		(long_name='Stock de capital de la familia ricardiana en el sector 2')
    K_3t_O    		${K_3t_O}$ 		(long_name='Stock de capital de la familia ricardiana en el sector 3')
//Revisar It
    I_t      		${I_t}$ (long_name='Saldo nominal de prestamos a la familia no-ricardiana')
//Empalmar Lt con ecuación pg. 32 [44]
    Lr_t     		${Lr_t}$ 		(long_name='Saldo real de prestamos a la familia no-ricardiana')
    l_t      		${l_t}$ 		(long_name='Tasa de apalancamiento de la familia no-ricardiana')
    M_t      		${M_t}$ 		(long_name='Importaciones reales totales')
    M_1t     		${M_1t}$ 		(long_name='Materias primas importadas usadas en el sector 1')
    M_2t     		${M_2t}$ 		(long_name='Materias primas importadas usadas en el sector 2')
    M_3t     		${M_3t}$ 		(long_name='Materias primas importadas usadas en el sector 3')
    M_Ct     		${M_Ct}$ 		(long_name='Importaciones de bienes de consumo')
    M_It     		${M_It}$ 		(long_name='Importaciones de bienes de capital y equipo')
//Empalmar nit con ecuación pg. 42 [88]
    n_1t     		${n_1t}$ 		(long_name='Demanda de trabajo de firmas del sector 1')
    n_2t     		${n_2t}$ 		(long_name='Demanda de trabajo de firmas del sector 2')
    n_3t     		${n_3t}$ 		(long_name='Demanda de trabajo de firmas del sector 3')
//Empalmar PIBNt con ecuación pg. 42 [84]
    PIB_Nt   		${PIB_Nt}$ 		(long_name='PIB nominal')
    PIB_Rt   		${PIB_Rt}$ 		(long_name='PIB real')
    P_1t     		${P_1t}$ 		(long_name='Precio del producto mayorista del sector 1')
    P_2t     		${P_2t}$ 		(long_name='Precio del producto mayorista del sector 2')
    P_Ct     		${P_Ct}$ 		(long_name='Indice de precios de la canasta de bienes de consumo')
    P_Dt     		${P_Dt}$ 		(long_name='Precio del bien domestico')
    P_Et     		${P_Et}$ 		(long_name='Indice de precios de exportaciones')
    P_Gt     		${P_Gt}$ 		(long_name='Indice de precios de la canasta de consumo del gobierno')
    P_It     		${P_It}$ 		(long_name='Precio del bien de inversion')
    P_Mt     		${P_Mt}$ 		(long_name='Precio interno de los bienes importados')
    P_PIBt   		${P_PIBt}$ 		(long_name='Deflactor implicito del PIB')
    P_1t_P    		${P_1t_P}$ 		(long_name='Precio al productor del bien del sector 1')
    P_2t_P    		${P_2t_P}$ 		(long_name='Precio al productor del bien del sector 2')
    P_3t_P    		${P_3t_P}$ 		(long_name='Precio al productor del bien del sector 3')
 //Empalmar PPjit con ecuación pg 27
    PP_1t_j   		${PP_1t_j}$ 		(long_name='Precio minorista de la variedad j en el sector 1')
    PP_2t_j   		${PP_2t_j}$ 		(long_name='Precio minorista de la variedad j en el sector 2')
 //Empalmar Prodit con con ecuación pg. 26
    Prod_1t  		${Prod_1t}$ 		(long_name='Ganancias agregadas de los minoristas del sector 1')
    Prod_2t  		${Prod_2t}$ 		(long_name='Ganancias agregadas de los minoristas del sector 2')
 //Empalmar Prodjit con ecuación pg. 27 [21]
    Prod_1t_j 		${Prod_1t_j}$ 		(long_name='Ganancias generadas por minorista j del sector 1')
    Prod_2t_j 		${Prod_2t_j}$ 		(long_name='Ganancias generadas por minorista j del sector 2')
 //Revisar ProdOt (pg. 34)
    Prod_Ot  		${Prod_Ot}$ 		(long_name='Ganancias de familia Ricardiana')
    fi_Ct   		${fi_Ct}$ 		(long_name='Tasa bruta de inflacion de la canasta de bienes de consumo')
    fi_1t   		${fi_1t}$ 		(long_name='Tasa bruta de inflacion de bien mayorista del sector 1')
    fi_2t   		${fi_2t}$ 		(long_name='Tasa bruta de inflacion de bien mayorista del sector 2')
    fi_Mt   		${fi_Mt}$ 		(long_name='Tasa de inflacion domestica de bienes importados')
//Empalmar rhot con ecuación pg. 40[81]
    ro_t    		${ro_t}$ 		(long_name='Prima de riesgo pais')
    R_t      		${R_t}$ 		(long_name='Tasa de interes nominal domestica')
    R_t_W     		${R_t_W}$ 		(long_name='Tasa bruta de interes externa ajustada por prima de riesgo pais')
    S_t      		${S_t}$ 		(long_name='Tasa de cambio del peso contra el dolar')
    TCR_t               ${TCR_t}$	        (long_name='tasa de cambio real')	
	TI_t            ${TI_t}$	        (long_name='terminos de intercambio')	
	u_1t            ${u_1t}$	        (long_name='costo real de alquiler de capital en el sector 1')	
	u_2t            ${u_2t}$		(long_name='costo real de alquiler de capital en el sector 2')
	u_3t            ${u_3t}$	        (long_name='costo real de alquiler de capital en el sector 3')
	V_Gt            ${V_Gt}$      		(long_name='Ingreso del gobierno por dividendos del sector petrolero*')
	V_Pt            ${V_Pt}$	        (long_name='Pago de dividendos del sector privado al gobierno*')
	W_1t            ${W_1t}$      		(long_name='Salario en sector 1')    
	W_2t            ${W_2t}$      		(long_name='Salario en sector 2')  
	W_3t            ${W_3t}$      		(long_name='Salario en sector 3')
	X_11t           ${X_11t}$	        (long_name='Insumo del sector 1 usado en la producción del sector 1')
	X_12t           ${X_12t}$	        (long_name='Insumo del sector 1 usado en la producción del sector 2')  
	X_13t           ${X_13t}$	        (long_name='Insumo del sector 1 usado en la producción del sector 3')  
	X_21t           ${X_21t}$	        (long_name='Insumo del sector 2 usado en la producción del sector 1')  
	X_22t           ${X_22t}$	        (long_name='Insumo del sector 2 usado en la producción del sector 2')  
	X_23t           ${X_23t}$	        (long_name='Insumo del sector 2 usado en la producción del sector 3')  
	X_31t           ${X_31t}$	        (long_name='Insumo del sector 3 usado en la producción del sector 1')  	
	X_32t           ${X_32t}$	        (long_name='Insumo del sector 3 usado en la producción del sector 2')  	
	X_33t           ${X_33t}$		(long_name='Insumo del sector 3 usado en la producción del sector 3')
	XX_11t          ${XX_1t}$		(long_name='compras minoristas de 1 del bien YY1*') 
	XX_12t          ${XX_12t}$		(long_name='compras minoristas de 2 del bien YY2*') 
	XX_21t          ${XX_21t}$		(long_name='compras minoristas de 2 del  bien YY1*')
	XX_22t          ${XX_22t}$		(long_name='compras minoristas  de 2 del bien YY2*')
	XX_j1t          ${XX_j1t}$		(long_name='compras del minorista j del bien YY1*')
	XX_j2t          ${XX_j2t}$		(long_name='compras del minorista j del bien YY2*')
	Y_Ct            ${Y_Ct}$		(long_name='produccion del bien de consumo')	
    	Y_Dt            ${Y_Dt}$		(long_name='produccion del bien domestico')
	Y_Gt            ${Y_Gt}$		(long_name='produduccion del bien de consumo del gobierno')
	Y_It            ${Y_It}$		(long_name='produccion del bien de inversión')	
	Y_1t            ${Y_1t}$		(long_name='produccion mayorista del sector 1')
	Y_2t            ${Y_2t}$		(long_name='produccion mayorista del sector 2')  
	YY_1t           ${YY_1t}$		(long_name='produccion bruta del sector 1') 
	YY_2t           ${YY_2t}$		(long_name='produccion bruta del sector 2') 
	YY_3t           ${YY_3t}$		(long_name='produccion bruta del sector 3')
	YY_j1t          ${YY_j1t}$		(long_name='Producción minorista de la variedad j en sector 1*')
	YY_j2t	        ${YY_j2t}$		(long_name='Producción minorista de la variedad j en sector 2*')	
	Z_1t            ${Z_1t}$		(long_name='Monto de Y1,t como insumo en producción del bien doméstico')	
	Z_2t            ${Z_2t}$		(long_name='Monto de Y2,t como insumo en producción del bien doméstico')	
	Z_Gt            ${Z_Gt}$		(long_name='Monto de Y2,t como insumo en el bien de consumo del gobierno')
	omega_t         ${omega_t}$		(long_name='precio sombra de la unidad adicional')
	;
//********************** ******************************
//definiendo variables exogenas   
//********************** ******************************
varexo
//Para cambios de endogeno en las variables de productividad ver pg. 58 del documento
	AA_t_1              ${AA_t_1}$		(long_name='Productividad total de los factores sector 1')
    	AA_t_2              ${AA_t_2}$		(long_name='Productividad total de los factores sector 2')
    	AA_t_3              ${AA_t_3}$		(long_name='Productividad total de los factores sector 3')
	A_t                 ${A_t}$		(long_name='Índice de productividad agregada multifactorial')
   	A_t_1               ${AA_t_1}$		(long_name='Índice de productividad específica a sector 1')
    	A_t_2               ${AA_t_2}$		(long_name='Índice de productividad específica a sector 2')
    	A_t_3               ${AA_t_3}$		(long_name='Índice de productividad específica a sector 3')
//Empalmar gamma_Lt con la ecuación de la pg. 32... as: asterisco, para diferenciar las variables internacionales de las domésticas
    	gamma_Lt            ${gamma_Lt}$	(long_name='Tasa bruta de crecimiento del crédito a la familia no Ricardiana')
	g_t_exo             ${g_t_exo}$		(long_name='Gasto corriente del gobierno como % del PIB, dado exógenamente')
	g_Ft                ${g_Ft}$		(long_name='% necesidad de financiación del gobierno con bonos domésticos')
	g_It                ${g_It}$		(long_name='Gasto en infraestructura como % del PIB nominal')
	P_t_oilas 	    ${P_t_oilas}$ 	(long_name='Precio del petroleo en el mercado internacional')
	P_t_cas   	    ${Pt_cas}$		(long_name='Precio externo de la canasta externa de bienes de consumo')
	fi_t_cas 	    ${fi_t_cas}$	(long_name='Tasa bruta de inflacion externa de la canasta de consumo')
	P_t_mas   	    ${P_t_mas}$		(long_name='Precio externo de las importaciones')
	R_t_as    	    ${R_t_as}$		(long_name='Tasa bruta de interes externa')
	R_t_exo   	    ${R_t_exo}$		(long_name='Tasa bruta de interes nominal dada exogenamente u observada')
	tau_Ct     	    ${tau_Ct}$		(long_name='Tasa efectiva de tributacion del consumo')
	tau_It     	    ${tau_It}$		(long_name='Tasa efectiva de tributacion de la inversion')
	tau_Kt     	    ${tau_Kt}$		(long_name='Tasa efectiva de tributacion de la renta de capital')
	tau_Nt     	    ${tau_Nt}$		(long_name='Tasa efectiva de tributacion del ingreso laboral')
	tau_CMt    	    ${tau_CMt}$		(long_name='Arancel efectivo sobre bienes de consumo importados')
	tau_IMt   	    ${tau_IMt}$ 	(long_name='Arancel efectivo sobre bienes de capital y equipo importados')
    	tau_1t_MX           ${tau_1t_MX}$	(long_name='arancel efectivo de materias primas importadas del sector 1')
	tau_2t_MX           ${tau_2t_MX}$	(long_name='arancel efectivo de materias primas importadas del sector 2')
	tau_3t_MX           ${tau_3t_MX}$	(long_name='arancel efectivo de materias primas importadas del sector 3')	
	tau_1t_X            ${tau_1t_X}$	(long_name='tasa de tributacion del consumo intermedio del sector 1')	
	tau_2t_X            ${tau_2t_X}$	(long_name='tasa de tributacion del consumo intermedio del sector 2')	
	tau_3t_X            ${tau_3t_X}$	(long_name='tasa de tributacion del consumo intermedio del sector 3')
	T_Gt                ${T_Gt}$		(long_name='transferencias del gobierno*')	
	T_Pt                ${T_Pt}$		(long_name='transferencias  recibidas por el sector privado*')	
	T_t_NO              ${T_t_NO}$		(long_name='transferencias recibidar por las familias no ricardianas')
	T_t_O               ${T_t_O}$		(long_name='transferencias recibidar por las familias ricardianas')
	V_t_O 	            ${V_t_O}$		(long_name='Pago de dividendos de la familia ricardiana*')	
	v_t	            ${v_t}$		(long_name='Pago de dividendos como % renta de capital del sector petrolero')	
	Yas_t	            ${Yas_t}$		(long_name='PIB Externo')
	;
//********************** *************************
//definiendo parametros
//********************** *************************
parameters    
    alfa_1	            ${alfa_1}$		(long_name='Elasticidad del valor agregado del sector 1 con respecto al capital')		
	alfa_2	            ${alfa_2}$		(long_name='Elasticidad del valor agregado del sector 2 con respecto al capital')		
	alfa_3              ${alfa_3}$		(long_name='Elasticidad del valor agregado del sector 3 con respecto al capital')	
	A_1	            ${A_1}$		(long_name='Parámetro de escala de la función de producción del sector 1')	
	A_2                 ${A_2}$		(long_name='Parámetro de escala de la función de producción del sector 2')			
	A_3                 ${A_3}$		(long_name='Parámetro de escala de la función de producción del sector 3')	
	A_C                 ${A_C}$		(long_name='Parámetro de escala de la función de producción del bien de consumo')
	A_D                 ${A_D}$		(long_name='Parámetro de escala de la función de producción del bien domestico')        
	A_E                 ${A_E}$		(long_name='Parámetro de escala de la función agregacion de exportaciones')	
	A_G                 ${A_G}$		(long_name='Parámetro de escala de la función de producción del bien de consumo del gobierno')	
	A_I                 ${A_I}$		(long_name='Parámetro de escala de la función de producción del bien de inversion')	
	A_P                 ${A_P}$		(long_name='Parámetro de escala de la función de prima de riesgo')
	A_X                 ${A_X}$		(long_name='Parámetro de escala de la función de demanda de exportaciones')
	beta	            ${beta}$		(long_name='factor subjetivo de descuento')
	gamma 	            ${gamma}$		(long_name='Tasa bruta de crecimiento del PIB por persona en edad de trabajar -15,64- años-')
    
//********************** *************************
//ecuaciones
//********************** *************************
//ecuaciones apendice B
//********************** *************************
// [19-20-21]
M_1t=ji_M_1*YY_1t;
M_2t=ji_M_2*YY_2t;
M_3t=ji_M_3*YY_3t;
// ecuacion [22]
P_3t_P=P_t_oilas*TCR_t;
//[38]
Y_Gt=A_G*Z_Gt;
//[39]
P_Gt=P_2t/A_G;
//[40]
c_t_NO=(1-((R_t/fi_Ct)-gamma_Lt)*l_t)+(W_1t*h_1t_NO+W_2t*h_2t_NO+W_3t*h_3t_NO)+T_t_NO; 
//[41]
l_t(+1)=l_t*(gamma_Lt/gamma)*(W_1t*h_1t_NO+W_2t*h_2t_NO+W_3t*h_3t_NO/(W_1t(+1)*h_1t_NO(+1)+W_2t(+1)*h_2t_NO(+1)+W_3t(+1)*h_3t_NO(+1)));
//[42-43-44]  
psi_1_NO*(h_1t_NO)^epsilon=(1-lt*((R_t/fi_Ct)-gamma_Lt))*W_1t);
psi_2_NO*(h_2t_NO)^epsilon=(1-lt*((R_t/fi_Ct)-gamma_Lt))*W_2t);
psi_3_NO*(h_3t_NO)^epsilon=(1-lt*((R_t/fi_Ct)-gamma_Lt))*W_3t);
//[57]
P_It* I_gt=g_It*PIB_Rt*P_PIBt;
//[58]
gamma*K_gt=(1-delta_g)*K_gt(-1)+I_gt-(ita_g/2)*((I_gt/K_gt(-1))-gamma+(1-delta_g))^2*K_gt(-1);
//[59]
P_gt*g_t=g_Ct*PIB_Rt*P_PIBt;
//[60]
gamma*B_gt=g_Ft*F_t;
//[61]
gamma*D_gt_as*TCR_t=(1-g_Ft)F_t;
//[62]*
F_T=P_gt*g_t_exo+P_It*I_gt+(R_t_W(-1)/fi_t_cas)*D_gt_as(-1)*TCR_t+(R_t(-1)/fi_Ct)*B_gt(-1)+T_Gt-tau_Ct*(1-lambda)*C_t_O-tau_It*P_I_t*(1-lambda)*(I_1t_O+I_2t_O+I_3t_O)-tau_Nt*(1-lambda)*(W_1t*h_1t_N+W_2t*h_2t_N+W_3t*h_3t_N)-tau_Kt*(1-lambda)*(u_1t*K_1t_O(-1)+u_2t*K_2t_O(-1)+u_3t*K_3t_O(-1))-P_Mt*(tau_1t_MX*M_1t+tau_2t_MX*M_2t+tau_3t_MX*M_3t+tau_CMt_*M_Ct +tau_IMt*M_It)-((tau_1t_X+tau_2t_X+tau_3t_X)*(PP_jt*X_11t+PP_jt*X_12t+PP_jt*X_13+PP_jt*X_21t+PP_jt*X_22t+PP_jt*X_23t+PP_jt*X_31t+PP_jt*X_32t*PP_jt*X_33t))-v_t*u_3t*(1-lambda)*K_3t_O(-1); 
//[69]
R_T_W=R_T_as*A_P*exp*(rho*(((TCR_t*(D_Pt_as(-1)+D_Gt_as(-1))/(PIB_Rt*P_PIBt))-dep)));
//[70]
g_Ct=II_gt*g_Ct_exo+(1-II_gt)*g_Ct(-1)*(((TCR_t*D_Gt_as(-1)+B_Gt(-1))/(PIB_t_R*P_PIBt))/(dpp))^(-sigma);
//[71]
R_t=II_Mt*R_t_exo+(1-II_mt)*((1-zita)*R_t*(fi_C_t/fi_C)^(iota)+zita*R_t(-1));

//********************** *************************
//seccion apendice C
//********************** *************************
//[19-20-21]
M_1t=ji_M_1*YY_1t;
M_2t=ji_M_2*YY_2t;
M_3t=ji_M_3*YY_3t;
// [37] 
Y_Gt=A_G*Z_Gt;
//[38] 
P_Gt=P_2t/A_G;
//[39] 
C_t_NO=(1-(R_t/fi_Ct-gamma_L)*l)*((W_1t*h_1t_NO+W_2t*h_2t_NO+W_3t*h_3t_NO))+t_NO;

//[40]
gamma_L=gamma;
//[41]
psi_1_NO*(h_1t_NO)^epsilon=(1-(R_t/fi_Ct-gamma_L)*l)*W_1t;
//[42]
psi_2_NO*(h_2t_NO)^epsilon=(1-(R_t/fi_Ct-gamma_L)*l)*W_2t;
//[43]
psi_3_NO*(h_3t_NO)^epsilon=(1-(R_t/fi_Ct-gamma_L)*l)*W_3t;
//[56]
I_Gt=g_I*PIB_Rt;
//[57]
I_Gt/K_gt=gamma-(1-sigma_G);
//[58]
g=g_c*PIB_Rt;
//[59]
gamma*b_g=g_F*F_t
//[60]
gamma*D_g_as=(1-g_F)*F_t
//[61]
F_t=g_t+I_Gt+(R_Wt/fi_Ct_as)*D_G_as+(R_t/fi_Ct)*b_G+t_G-tau_Ct*(1-lambda)*(I_1t_O+I_2t_O+I_3t_O)-tau_Nt*(1-lambda)*(W_1t*h_1_O+W_2t*h_2_O+W_3t*h_3_O)-(tau_1t_MX*M_1t+tau_2t_MX*M_2t+tau_3t_MX*M_3t+tau_Ct_M*M_Ct+tau_It_M*M_I)((tau_1t_X+tau_2t_X+tau_3t_X)*(PP_jt*X_11t+PP_jt*X_12t+PP_jt*X_13+PP_jt*X_21t+PP_jt*X_22t+PP_jt*X_23t+PP_jt*X_31t+PP_jt*X_32t*PP_jt*X_33t))-(tau_Kt*(1-lambda)*(u_1*k_1t_O+u_2*k_2t_O+u_3*k_3t_O)-v_t*u_3t*(1-lambda)*K_3t_O;
//[66]

R_t_w=R_t_as*A_rho;
//[75]
Y_Dt=D_ct+D_it;
//[76]
Y_1t=P_1t*Z_1t;
//[77]
Y_2t=P_2t*(Z_2t+Z_Gt);
//[78]
(gamma-(R_Wt/fi_C_as)*(D_pt_as+D_gt_as)=M_t-E_t;
