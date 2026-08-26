# Task 5: Infrastructure metrics aggregator

# Telemetry data stream from cluster servers
system_telemetry = [
    ("srv_01", 12.5, 64, "online"),
    ("srv_02", 85.0, 92, "online"),
    ("srv_03", 0.0, 0, "offline"),
    ("srv_04", 45.2, 78, "online"),
    ("srv_05", 95.1, 99, "online")
]
# Metrics aggregation pipeline implementation

active_nodes = []   # Server names
cpu_loads = []      # CPU loads
ram_usages = []     # RAM usages

# Unpack tuples directly in the for-loop header
for node_name, cpu_load, ram_usage, status in system_telemetry:
    # Filter out servers with offline status
    if status == "online":
        active_nodes.append(node_name)
        cpu_loads.append(cpu_load)
        ram_usages.append(ram_usage)
# Calculate final metrics using built-in aggregate functions
number_of_running_servers = len(active_nodes)
avg_load = round(sum(cpu_loads) / number_of_running_servers, 2)
max_usage = max(ram_usages)

report = {
    'active_nodes_count': number_of_running_servers,
    'metrics': {
        'average_cpu': avg_load,
        'max_ram': max_usage
    }
}
# Output results
print(f"Активные узлы в сети: {active_nodes}")
print("Итоговый отчет телеметрии:")
print(report)