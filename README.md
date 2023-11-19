
sequenceDiagram
  Actor User as User
  participant FE as Frontend
  participant BE as Backend
  participant ASP as Accounting Software
  participant DE as Decision Engine

  User ->> FE: Start Application

  FE ->> BE: Initiate Application
  BE ->> FE: Initiate Complete

  User ->> FE: Fill Business Details & Loan amount
  User ->> FE: Select Accounting provider
  User ->> FE: Request Balance Sheet
  FE ->> BE: Fetch Balance Sheet
  BE ->> ASP: Request Balance Sheet
  ASP ->> BE: Return Balance Sheet
  BE ->> FE: Return Details for Review

  User --> FE: Review Complete
  User ->> FE: Submit Application

  FE ->> BE: Request outcome
  BE ->> BE: Apply Rules to summarise application
  BE ->> DE: Request Decision
  DE ->> BE: Returns outcome

  BE ->> FE: Application Result
  FE ->> User: Final Outcome

