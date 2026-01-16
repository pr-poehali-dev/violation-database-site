-- Создание таблицы для протоколов и актов нарушений
CREATE TABLE IF NOT EXISTS violations (
    id SERIAL PRIMARY KEY,
    document_number VARCHAR(50) UNIQUE NOT NULL,
    document_date DATE NOT NULL,
    violation_type VARCHAR(100) NOT NULL,
    status VARCHAR(50) NOT NULL,
    organization VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    inspector VARCHAR(255) NOT NULL,
    deadline DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Создание индексов для быстрого поиска
CREATE INDEX idx_violations_document_number ON violations(document_number);
CREATE INDEX idx_violations_status ON violations(status);
CREATE INDEX idx_violations_violation_type ON violations(violation_type);
CREATE INDEX idx_violations_organization ON violations(organization);
CREATE INDEX idx_violations_document_date ON violations(document_date);

-- Вставка тестовых данных
INSERT INTO violations (document_number, document_date, violation_type, status, organization, description, inspector, deadline) VALUES
('ПР-2024-001', '2026-01-15', 'ПДД', 'Открыт', 'ООО "Транспорт+"', 'Превышение скорости на 40 км/ч', 'Иванов И.И.', '2026-01-30'),
('АК-2024-045', '2026-01-14', 'Пожарная безопасность', 'В работе', 'ИП Петров', 'Отсутствие огнетушителей в помещении', 'Смирнова А.П.', '2026-01-25'),
('ПР-2024-002', '2026-01-13', 'Санитарные нормы', 'Закрыт', 'Кафе "Уют"', 'Нарушение температурного режима хранения продуктов', 'Козлов В.В.', '2026-01-20'),
('АК-2024-046', '2026-01-12', 'Трудовое право', 'Просрочен', 'ООО "Стройком"', 'Невыплата заработной платы', 'Морозова Е.Л.', '2026-01-10'),
('ПР-2024-003', '2026-01-11', 'Экология', 'Открыт', 'Завод "Металлург"', 'Превышение ПДК выбросов', 'Сидоров П.Р.', '2026-01-28'),
('АК-2024-047', '2026-01-10', 'ПДД', 'В работе', 'Такси "Быстро"', 'Отсутствие страховки ОСАГО', 'Иванов И.И.', '2026-01-22');