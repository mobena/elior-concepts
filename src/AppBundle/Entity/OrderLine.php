<?php

namespace AppBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * OrderLine
 *
 * @ORM\Table(name="order_line")
 * @ORM\Entity(repositoryClass="AppBundle\Repository\OrderLineRepository")
 */
class OrderLine
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
     * @var int
     *
     * @ORM\Column(name="quantity", type="integer")
     */
    private $quantity;

    /**
     * @var float
     *
     * @ORM\Column(name="price_per_unit_ht", type="float")
     */
    private $pricePerUnitHt;

    /**
     * @var float
     *
     * @ORM\Column(name="price_per_unit_ttc", type="float")
     */
    private $pricePerUnitTtc;

    /**
     * @var float
     *
     * @ORM\Column(name="price_ht", type="float")
     */
    private $priceHt;

    /**
     * @var float
     *
     * @ORM\Column(name="price_ttc", type="float")
     */
    private $priceTtc;

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
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set quantity
     *
     * @param integer $quantity
     *
     * @return OrderLine
     */
    public function setQuantity($quantity)
    {
        $this->quantity = $quantity;

        return $this;
    }

    /**
     * Get quantity
     *
     * @return int
     */
    public function getQuantity()
    {
        return $this->quantity;
    }

    /**
     * Set pricePerUnitHt
     *
     * @param float $pricePerUnitHt
     *
     * @return OrderLine
     */
    public function setPricePerUnitHt($pricePerUnitHt)
    {
        $this->pricePerUnitHt = $pricePerUnitHt;

        return $this;
    }

    /**
     * Get pricePerUnitHt
     *
     * @return float
     */
    public function getPricePerUnitHt()
    {
        return $this->pricePerUnitHt;
    }

    /**
     * Set pricePerUnitTtc
     *
     * @param float $pricePerUnitTtc
     *
     * @return OrderLine
     */
    public function setPricePerUnitTtc($pricePerUnitTtc)
    {
        $this->pricePerUnitTtc = $pricePerUnitTtc;

        return $this;
    }

    /**
     * Get pricePerUnitTtc
     *
     * @return float
     */
    public function getPricePerUnitTtc()
    {
        return $this->pricePerUnitTtc;
    }

    /**
     * Set priceHt
     *
     * @param float $priceHt
     *
     * @return OrderLine
     */
    public function setPriceHt($priceHt)
    {
        $this->priceHt = $priceHt;

        return $this;
    }

    /**
     * Get priceHt
     *
     * @return float
     */
    public function getPriceHt()
    {
        return $this->priceHt;
    }

    /**
     * Set priceTtc
     *
     * @param float $priceTtc
     *
     * @return OrderLine
     */
    public function setPriceTtc($priceTtc)
    {
        $this->priceTtc = $priceTtc;

        return $this;
    }

    /**
     * Get priceTtc
     *
     * @return float
     */
    public function getPriceTtc()
    {
        return $this->priceTtc;
    }

    /**
     * Set createdAt
     *
     * @param \DateTime $createdAt
     *
     * @return OrderLine
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
     * @return OrderLine
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
     * @return OrderLine
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
}

