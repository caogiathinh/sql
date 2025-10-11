# SQL Practice Repository

Welcome to the **SQL Practice Repository**! This repository contains hands-on SQL exercises organized into parts, each focusing on different SQL concepts and practices.

## Project Folder Structure

```
sql/
├── README.md
├── exercises/
│   ├── Exercise.39.txt
│   ├── Exercise.ERD.1N.Relationship.txt
├── hands-on/
│   ├── Part1-Introduction/
│   ├── Part2-SQL/
│   │   ├── Session01-BasicSelect/
│   │   │   ├── 01-SELECT only.sql
│   │   │   ├── 02-SELECT one table.sql
│   │   │   ├── 03-SELECT DISTINCT.sql
│   │   │   ├── 04-SELECT ORDER BYsql.sql
│   │   │   ├── 05-SELECT WHERE.sql
│   │   │   ├── 06-SELECT RANGE.sql
│   │   │   ├── 07-SELECT NULL.sql
│   │   │   ├── 08-SELECT LIKE.sql
│   │   ├── Session02-SubQuery/
│   │   │   ├── 01-SingleValue.sql
│   │   │   ├── 02-MultipleValues.sql
│   │   │   ├── 03-All-ANY.sql
│   │   ├── Session03-AggregateFunction/
│   │   │   ├── 01-Count.sql
│   │   │   ├── 02-MinMaxSumAvg.sql
│   │   ├── Session04-JOIN/
│   │   │   ├── 00-ClubManagement.sql
│   │   │   ├── 00-StudentManagement.sql
│   │   │   ├── 01-Cartesian.sql
│   │   │   ├── 02-InnerJoin.sql
│   │   │   ├── 03-Outer.sql
│   ├── Part3-DB-Design/
│   │   ├── 01-OneTable.sql
│   │   ├── 01.OneTable.Constriants.sql
│   │   ├── 01.OneTable.Generated.sql
│   │   ├── 02-TwoTables.1N.Relationship.Generated.sql
│   │   ├── 02-TwoTables.1N.Relationship.sql
│   │   ├── 02.TwoTables.1N.Relationship.vpp
│   │   ├── 02.TwoTables.1N.Relationship.vpp.bak_000f
│   │   ├── Conceptual.1N.Relationship.png
│   │   ├── ConceptualLevel.png
│   │   ├── Logical.1N.Relationship.png
│   │   ├── LogicalLevel.png
│   │   ├── Physical.1N.Relationship.png
│   │   ├── PhysicalLevel.png
│   │   ├── phonebook/
│   │   │   ├── 01-FirstDesign.sql
│   │   │   ├── 02.HorizontalDesign.sql
│   │   │   ├── 03.VerticalDesign.sql
│   │   │   ├── 04.Decomposition.sql
│   │   │   ├── 05.NormalizationForm.sql  
│   │   │   ├── NormalizationForms.png  
│   │   ├── locations/
│   │   │   ├── 01.FunctionalDependency.sql
│   │   │   ├── so-suc-khoe-dien-tu-crawler.zip
│   │   │   ├── vn-locations.csv
│   │   │   ├── vn-locations.txt
│   ├── Part4-Programming/
│   ├── 05-NormalizationForm/
│   │   ├── 01-noNF.sql
├── sample-db/
│   └── Microsoft.Northwind/

```

### Example `.sql` Files

**Part2-SQL:** Focuses on SQL basics and query techniques.
- `Session01-BasicSelect/01-SELECT only.sql`: Basic SELECT statement usage.
- `Session01-BasicSelect/02-SELECT one table.sql`: SELECT from one table.
- `Session01-BasicSelect/03-SELECT DISTINCT.sql`: Using DISTINCT to filter unique results.
- `Session01-BasicSelect/04-SELECT ORDER BYsql.sql`: Using ORDER BY for sorting results.
- `Session01-BasicSelect/05-SELECT WHERE.sql`: Filtering with WHERE clause.
- `Session01-BasicSelect/06-SELECT RANGE.sql`: Using BETWEEN and IN for ranges.
- `Session01-BasicSelect/07-SELECT NULL.sql`: Handling NULL values.
- `Session01-BasicSelect/08-SELECT LIKE.sql`: Pattern matching with LIKE.
- `Session02-SubQuery/01-SingleValue.sql`: Subquery returning a single value.
- `Session02-SubQuery/02-MultipleValues.sql`: Subquery returning multiple values.
- `Session02-SubQuery/03-All-ANY.sql`: Subquery examples with ALL/ANY.
- `Session03-AggregateFunction/01-Count.sql`: Using COUNT aggregate function.
- `Session03-AggregateFunction/02-MinMaxSumAvg.sql`: Using MIN, MAX, SUM, AVG functions.
- `Session04-JOIN/00-ClubManagement.sql`: n-n relationship example.
- `Session04-JOIN/00-StudentManagement.sql`: 1-n relationship example.
- `Session04-JOIN/01-Cartesian.sql`: Demonstrates Cartesian joins.
- `Session04-JOIN/02-InnerJoin.sql`: Demonstrates Inner joins.
- `Session04-JOIN/03-Outer.sql`: Demonstrates Outer joins.

**Part3-DB-Design:** Focuses on database design and concepts.
- `01-OneTable.sql`: One table design.
- `01.OneTable.Constriants.sql`: Table constraints example.
- `01.OneTable.Generated.sql`: Table with generated columns.
- `02-TwoTables.1N.Relationship.Generated.sql`: Two tables with 1-N relationship and generated columns.
- `02-TwoTables.1N.Relationship.sql`: Two table design with 1-N relationship.
- `locations/01-FunctionalDependency.sql`: First locations table design.
- `phonebook/01-FirstDesign.sql`: Initial phonebook design.
- `phonebook/02.HorizontalDesign.sql`: Horizontally partitioned phonebook design.   
- `phonebook/03.VerticalDesign.sql`: Vertically partitioned phonebook design.
- `phonebook/04.Decomposition.sql`: Decomposed phonebook design.
- `phonebook/05.NormalizationForm.sql`: Phonebook design with normalization forms.

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

Happy SQL Learning - Happy Coding!
