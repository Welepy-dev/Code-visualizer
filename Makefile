
# Compiler and flags
CC = g++
CFLAGS = -Wall -std=c++11 -Iinc -Iinc/rlImGui -Iinc/imgui
LDFLAGS = -lraylib -lGL -lm -lpthread -ldl -lrt -lX11

# Source files
SOURCES = src/main.cpp inc/rlImGui/rlImGui.cpp \
          inc/imgui/imgui.cpp inc/imgui/imgui_draw.cpp \
          inc/imgui/imgui_widgets.cpp inc/imgui/imgui_tables.cpp

# Object files
OBJECTS = $(SOURCES:.cpp=.o)

# Executable name
EXEC = code_visualizer

# Build rules
all: $(EXEC)

$(EXEC): $(OBJECTS)
	$(CC) $(OBJECTS) -o $@ $(LDFLAGS)

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(OBJECTS) $(EXEC)

.PHONY: all clean
