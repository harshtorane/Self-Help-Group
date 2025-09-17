<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Dashboard</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f9;
        }

        /* Sidebar */
        .sidebar {
            width: 240px;
            background: linear-gradient(180deg, #6a1b9a, #8e24aa);
            color: white;
            height: 100vh;
            position: fixed;
            left: 0;
            top: 0;
            padding: 20px 15px;
            box-shadow: 3px 0 8px rgba(0,0,0,0.2);
            display: flex;
            flex-direction: column;
            align-items: flex-start;
        }

        .sidebar h2 {
            margin-bottom: 20px;
            text-align: center;
            width: 100%;
        }

        .sidebar a {
            display: block;
            padding: 12px 20px;
            color: white;
            text-decoration: none;
            font-size: 16px;
            margin: 5px 0;
            width: 100%;
            border-radius: 8px;
            transition: background 0.3s ease;
        }

        .sidebar a:hover {
            background: rgba(255,255,255,0.2);
        }

        /* Main content */
        .main-content {
            margin-left: 240px;
            margin-top: 20px;
            padding: 30px;
        }

        .main-content h2 {
            color: #4a148c;
            margin-bottom: 10px;
        }

        .welcome {
            font-size: 18px;
            margin-bottom: 20px;
            color: #555;
        }

        /* Stats cards */
        .stats {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
        }

        .stat-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            flex: 1;
            min-width: 220px;
            text-align: center;
        }

        .stat-card h3 {
            font-size: 18px;
            color: #444;
            margin-bottom: 10px;
        }

        .stat-card span {
            font-size: 28px;
            font-weight: bold;
            color: #6a1b9a;
        }

        /* Chart + Table */
        .charts-tables {
            margin-top: 40px;
            display: flex;
            gap: 30px;
            flex-wrap: wrap;
        }

        .chart-container, .table-container {
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            flex: 1;
            min-width: 400px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #eee;
            text-align: left;
        }

        th {
            background: #f4f4f4;
            color: #444;
        }

        /* Footer */
        .footer {
            margin-top: 40px;
            text-align: center;
            color: #777;
            font-size: 14px;
        }
    </style>
</head>
<body onload="noBack();" onpageshow="if (event.persisted) noBack();">

    <!-- Sidebar -->
    <div class="sidebar">
        <h2>SHG Portal</h2>
        <a href="<c:url value='/dashboard'/>"><i class="fas fa-house"></i> Dashboard</a>
        <a href="<c:url value='/viewProfileForm'/>"><i class="fas fa-user"></i> View Profile</a>
        <a href="<c:url value='/register'/>"><i class="fas fa-user-plus"></i> Register Member</a>
        <a href="<c:url value='/viewData'/>"><i class="fas fa-table"></i> View Data</a>
        <a href="<c:url value='/loanForm'/>"><i class="fas fa-hand-holding-dollar"></i> Issue Loan</a>
        <a href="<c:url value='/viewLoans'/>"><i class="fas fa-file-invoice-dollar"></i> View Loans</a>
        <a href="<c:url value='/'/>"><i class="fas fa-right-from-bracket"></i> Logout</a>
    </div>

    <!-- Main content -->
    <div class="main-content">
        <h2>Welcome, ${username} (${role}) 🎉</h2>
        <p class="welcome">Select an option from the sidebar to continue.</p>

        <!-- Stats -->
        <div class="stats">
            <div class="stat-card">
                <h3>Total Members</h3>
                <span>${totalMembers}</span>
            </div>
            <div class="stat-card">
                <h3>Total Saving</h3>
                <span>₹ ${totalSaving}</span>
            </div>
            <div class="stat-card">
                <h3>Fine</h3>
                <span>₹ ${totalFine}</span>
            </div>
            <div class="stat-card">
                <h3>Total</h3>
                <span>₹ ${totalTotal}</span>
            </div>
            
          
        </div>

        <!-- Charts + Top Savers -->
        <div class="charts-tables">
            <!-- Chart -->
            <div class="chart-container">
                <h3>Savings Overview</h3>
                <canvas id="savingsChart"></canvas>
            </div>

            <!-- Top Savers -->
            <div class="table-container">
                <h3>🏆 Top Savers</h3>
                <table>
                    <tr>
                        <th>Name</th>
                        <th>Monthly Saving</th>
                    </tr>
                    <c:forEach var="m" items="${topSavers}">
                        <tr>
                            <td>${m.name}</td>
                            <td>${m.monthly_saving}</td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty topSavers}">
                        <tr><td colspan="2">No records found</td></tr>
                    </c:if>
                </table>
            </div>
        </div>

        <!-- Footer -->
        <div class="footer">
            &copy; 2025 Self Help Group | Designed by Harsh 🚀
        </div>
    </div>

    <!-- Back button disable script -->
    <script type="text/javascript">
        window.history.forward();
        function noBack() {
            window.history.forward();
        }
    </script>

    <!-- Chart JS Script -->
    <script>
        const ctx = document.getElementById('savingsChart').getContext('2d');
        const savingsChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Savings', 'Fine', 'Total'],
                datasets: [{
                    label: 'Amount in ₹',
                    data: [
                        ${totalSaving != null ? totalSaving : 0},
                        ${totalFine != null ? totalFine : 0},
                        ${totalTotal != null ? totalTotal : 0}
                    ],
                    backgroundColor: ['green', 'red', '#ab47bc']
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    legend: { display: false }
                }
            }
        });
    </script>
</body>
</html>
