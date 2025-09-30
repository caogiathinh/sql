# SQL Practice Repository

Welcome to the **SQL Practice Repository**! This repository contains hands-on SQL exercises organized into parts, each focusing on different SQL concepts and practices.

## Folder Structure

```
sql/
├── README.md
└── hands-on/
    ├── Part2-SQL/
    │   ├── Session01-BasicSelect/
    │   │   ├── 01-SELECT only.sql
    │   │   ├── 02-SELECT one table.sql
    │   │   ├── 03-SELECT DISTINCT.sql
    │   │   ├── 05-SELECT WHERE.sql
    │   │   ├── 06-SELECT RANGE.sql
    │   │   ├── 07-SELECT NULL.sql
    │   │   ├── 08-SELECT LIKE.sql
    │   ├── Session02-SubQuery/
    │   │   ├── 03-All-ANY.sql
    │   ├── Session04-JOIN/
    │   │   ├── 00-ClubManagement.sql
    │   │   ├── 00-StudentManagement.sql
    │   │   ├── 01-Cartesian.sql
    |   |   ├── 02-InnerJoin.sql    
    |   |   ├── 03-Outer.sql  
    └── Part4-DesignDatabase/
        ├── 01-OneTable.sql 
        ├── 01-OneTable.Constraints.sql
        ├── 01-OneTable.Generated.sql
        ├── 02-TwoTables.1N.Relationship.sql
        ├── 02-TwoTables.1N.Relationship.Generated.sql
        ├── 02-TwoTables.1N.Relationship.vpp
    └── Part5-NF/
        ├── 01-noNF.sql
        
```

### Example `.sql` Files

**Part2-SQL:** Focuses on SQL basics and query techniques.
- `Session01-BasicSelect/01-SELECT only.sql`: Basic SELECT statement usage.
- `Session01-BasicSelect/03-SELECT DISTINCT.sql`: Using DISTINCT to filter unique results.
- `Session01-BasicSelect/05-SELECT WHERE.sql`: Filtering with WHERE clause.
- `Session01-BasicSelect/06-SELECT RANGE.sql`: Using BETWEEN and IN for ranges.
- `Session01-BasicSelect/08-SELECT LIKE.sql`: Pattern matching with LIKE.
- `Session02-SubQuery/03-All-ANY.sql`: Subquery examples with ALL/ANY.
- `Session04-JOIN/00-ClubManagement.sql`: n-n relationship.
- `Session04-JOIN/00-StudentManagement.sql`: 1-n relationship.
- `Session04-JOIN/01-Cartesian.sql`: Demonstrates Cartesian joins.
- `Session04-JOIN/02-InnerJoin.sql`: Demonstrates Inner joins.
- `Session04-JOIN/03-Outer.sql`: Demonstrates Outer joins.

**Part3-DatabaseDesign** Focuses Database Design, Database concept.
- `01-OneTable.sql`: One table design.
- `02-TwoTables.1N.Relationship.sql`: Two table design with 1-N Relationship


**Part5-NF:** Focuses on database normalization forms.
- `01-noNF.sql`: Example of a table design with no normalization.

> **Note:** This is a partial listing. For a complete and updated list, visit the [GitHub repository](https://github.com/caogiathinh/sql).

## Getting Started

1. **Clone the repository:**
   ```bash
   git clone https://github.com/caogiathinh/sql.git
   cd sql
   ```
2. **Explore Exercises:**
   - Navigate to the `hands-on/` directory.
   - Each part contains focused practice problems and examples in `.sql` files.

## Contribution

Feel free to add new parts, SQL exercises, or improve existing ones by submitting a pull request.

## License

This repository is licensed under the MIT License.

## Author

**caogiathinh**

---

Happy SQL Learning!
