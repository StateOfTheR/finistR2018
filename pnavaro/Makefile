
default: exe_armadillo

CXX                 = mpic++
ARMADILLO_INCDIR   = /usr/local/include
ARMADILLO_LIBDIR   = /usr/local/lib
ARMADILLO_INC_FLAGS = -I${ARMADILLO_INCDIR}
ARMADILLO_LIB_FLAGS = -L${ARMADILLO_LIBDIR} -larmadillo

ex_armadillo.o: ex_armadillo.cpp

.cpp.o:
	$(CXX) $(CXXFLAGS) -c $< -o $@
    
exe_armadillo: main.cpp obj_armadillo.o
	${CXX} -o $@ $^ ${ARMADILLO_LIB_FLAGS}
    
clean:
	rm *.txt *.o exe_armadillo