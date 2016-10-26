<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use AppBundle\Entity\User;
use AppBundle\Entity\Concept;
use AppBundle\Entity\Product;

/**
 * ConceptProduct
 *
 * @ORM\Table(name="concept_product")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\ConceptProductRepository")
 */
class ConceptProduct
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var bool
     *
     * @ORM\Column(name="is_mandatory", type="boolean")
     */
    private $isMandatory;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="created_at", type="datetime")
     */
    private $createdAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="updated_at", type="datetime", nullable=true)
     */
    private $updatedAt;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="deleted_at", type="datetime", nullable=true)
     */
    private $deletedAt;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Concept")
     * @ORM\JoinColumn(nullable=false)
     */
    private $concept;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\Product")
     * @ORM\JoinColumn(nullable=false)
     */
    private $product;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\User")
     * @ORM\JoinColumn(nullable=false)
     */
    private $creator;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\User")
     * @ORM\JoinColumn(nullable=true)
     */
    private $updator;

    public function __construct()
    {
        $this->createdAt = new \DateTime();
    }

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set isMandatory
     *
     * @param boolean $isMandatory
     *
     * @return ConceptProduct
     */
    public function setIsMandatory($isMandatory)
    {
        $this->isMandatory = $isMandatory;

        return $this;
    }

    /**
     * Get isMandatory
     *
     * @return bool
     */
    public function getIsMandatory()
    {
        return $this->isMandatory;
    }

    /**
     * Set createdAt
     *
     * @param \DateTime $createdAt
     *
     * @return ConceptProduct
     */
    public function setCreatedAt($createdAt)
    {
        $this->createdAt = $createdAt;

        return $this;
    }

    /**
     * Get createdAt
     *
     * @return \DateTime
     */
    public function getCreatedAt()
    {
        return $this->createdAt;
    }

    /**
     * Set updatedAt
     *
     * @param \DateTime $updatedAt
     *
     * @return ConceptProduct
     */
    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    /**
     * Get updatedAt
     *
     * @return \DateTime
     */
    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }

    /**
     * Set deletedAt
     *
     * @param \DateTime $deletedAt
     *
     * @return ConceptProduct
     */
    public function setDeletedAt($deletedAt)
    {
        $this->deletedAt = $deletedAt;

        return $this;
    }

    /**
     * Get deletedAt
     *
     * @return \DateTime
     */
    public function getDeletedAt()
    {
        return $this->deletedAt;
    }

    /**
     * @return mixed
     */
    public function getConcept()
    {
        return $this->concept;
    }

    /**
     * @param mixed $concept
     */
    public function setConcept($concept)
    {
        $this->concept = $concept;
    }

    /**
     * @return mixed
     */
    public function getProduct()
    {
        return $this->product;
    }

    /**
     * @param mixed $product
     */
    public function setProduct($product)
    {
        $this->product = $product;
    }

    /**
     * @return mixed
     */
    public function getCreator()
    {
        return $this->creator;
    }

    /**
     * @param mixed $creator
     */
    public function setCreator($creator)
    {
        $this->creator = $creator;
    }

    /**
     * @return mixed
     */
    public function getUpdator()
    {
        return $this->updator;
    }

    /**
     * @param mixed $updator
     */
    public function setUpdator($updator)
    {
        $this->updator = $updator;
    }
}

