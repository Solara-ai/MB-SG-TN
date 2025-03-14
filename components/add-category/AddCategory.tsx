import React, { useState } from 'react';

const AddCategory: React.FC = () => {
  const [categoryName, setCategoryName] = useState('');

  const handleInputChange = (event: React.ChangeEvent<HTMLInputElement>) => {
    setCategoryName(event.target.value);
  };

  const handleSubmit = (event: React.FormEvent<HTMLFormElement>) => {
    event.preventDefault();
    // Logic to add the category
    console.log('Category added:', categoryName);
    setCategoryName('');
  };

  return (
    <div className="add-category">
      <h2>Add New Category</h2>
      <form onSubmit={handleSubmit}>
        <input
          type="text"
          value={categoryName}
          onChange={handleInputChange}
          placeholder="Enter category name"
          required
        />
        <button type="submit">Add Category</button>
      </form>
    </div>
  );
};

export default AddCategory;