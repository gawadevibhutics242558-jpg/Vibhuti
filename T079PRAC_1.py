from collections import deque
import time

# Graph: Borivali to Bandra
graph = {
    "Borivali": ["Kandivali", "Dahisar"],
    "Kandivali": ["Malad", "Goregaon"],
    "Dahisar": ["Mira Road"],
    "Malad": ["Jogeshwari"],
    "Goregaon": ["Andheri"],
    "Mira Road": ["Bandra"],
    "Jogeshwari": ["Bandra"],
    "Andheri": ["Bandra"],
    "Bandra": []
}

#BFS 
def bfs(graph, start, goal):
    visited = set()
    queue = deque([(start, [start])])

    print("BFS Traversal:\n")

    while queue:
        node, path = queue.popleft()

        if node not in visited:
            print(node)
            visited.add(node)

            if node == goal:
                print("\nShortest Path:")
                print(" -> ".join(path))
                return path

            for neighbor in graph[node]:
                if neighbor not in visited:
                    queue.append((neighbor, path + [neighbor]))


# DFS 
def dfs(graph, start, goal):
    visited = set()
    stack = [(start, [start])]

    print("\nDFS Traversal:\n")

    while stack:
        node, path = stack.pop()

        if node not in visited:
            print(node)
            visited.add(node)

            if node == goal:
                print("\nPath Found:")
                print(" -> ".join(path))
                return path

            for neighbor in reversed(graph[node]):
                if neighbor not in visited:
                    stack.append((neighbor, path + [neighbor]))


# Source and Destination
source = "Borivali"
destination = "Bandra"

print("Source      :", source)
print("Destination :", destination)
print("-" * 40)

# Run BFS
start_time = time.time()
bfs_path = bfs(graph, source, destination)
bfs_time = time.time() - start_time

# Run DFS
start_time = time.time()
dfs_path = dfs(graph, source, destination)
dfs_time = time.time() - start_time

# Comparison
print("\n===== BFS vs DFS Comparison =====\n")

print("BFS Path:", " -> ".join(bfs_path))
print("DFS Path:", " -> ".join(dfs_path))

print("\nExecution Time:")
print("BFS Time:", bfs_time)
print("DFS Time:", dfs_time)

print("\nConclusion:")
print("BFS gives the shortest path, while DFS may use less memory.")