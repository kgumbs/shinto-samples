from dataclasses import dataclass

@dataclass
class User:
    name: str

    @property
    def name_upper(self):
        return self.name.upper()
