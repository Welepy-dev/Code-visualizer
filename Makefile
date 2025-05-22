CC	=	g++
CFLAGS = -Wall -std=c++17 -Iinc -Iinc/rlImGui -Iinc/imgui
LDFLAGS = -Llib -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

SOURCES = src/main.cpp								\
					inc/rlImGui/rlImGui.cpp 		\
					inc/imgui/imgui.cpp					\
					inc/imgui/imgui_draw.cpp		\
					inc/imgui/imgui_widgets.cpp	\
					inc/imgui/imgui_tables.cpp


OBJECTS = $(SOURCES:.cpp=.o)

EXEC = code_visualizer

all: $(EXEC)

$(EXEC): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@                                                        

clean:
	rm -f $(OBJECTS) $(EXEC)                                                           

.PHONY: all clean                               
