Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEFA73F1655
	for <brcm80211@lists.linux.dev>; Thu,  7 May 2026 14:23:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778163829; cv=none; b=SsK/zTPKfVncZQRpE6OaNCXDyWwjJ2hYqiYfzZZ6xSOks2CovUTRcWVZz1+pQp9o3e2fEzL5kdpYhMjuOodqMTPcBzmqNzJjradqaWEwmXh5lyeHizLC/xgczDZhzaA6kniW0Rw21sicGXP3/bCD7C2GNqrlgOFGh9i3lsKaJ5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778163829; c=relaxed/simple;
	bh=9PPgK4QLRSfTOdseskC5krVmq0BpGiNeGu5HCLmSg74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emzg2Q69iUIXF16+Q9PbtGdxhhxvtzNtCxMBnBwGlAh8Wt6UkIt3uPUoFynK8iLVgJwYEmLeY7jWZgjT9vYh7XN3l6Jk3owfG3kgvwOPxAmEBVaaKm4yoHfglfmXqXH26LyloKgGZRqDAAPIS6K8mS4499hcHw2eXYhVcDDwYIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=sqlNt7C6; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="sqlNt7C6"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so8131505e9.0
        for <brcm80211@lists.linux.dev>; Thu, 07 May 2026 07:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1778163825; x=1778768625; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KHdHPIlg8ERzV5KgqRTDZ9XRFXSHKLYAiHw6AYH9eg4=;
        b=sqlNt7C6mAQFZJvW2FDCRTDdblEuc3vmqCF7BpYKv9il+pV6C/G7uS77ED84jc6rDe
         cmhwYhSEfVecsUKe65NpBx0CDWlqbA8qKBnlxFFAzagAa7w3a8gCJAKPg+9zhruw9lJD
         oXLrsr5stwgtlwOnbxR4hz0vrUOsf9/r+KtWqJRvmDSZF28iT2KxN+2Don7EX2/27HOP
         llHZ0CDhSuk9FsJuaQIOVZmvva6l0WpJ10x1+HnQPNC6re9B/8HLPwgYKvyqUdxCiBSo
         j11IGXVbSJ2DMd4rsnDCGO5qprODBnOsk/cvlcCCtDLs4DJPDeAJlhjp3DflavvzFu7f
         Flig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778163825; x=1778768625;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KHdHPIlg8ERzV5KgqRTDZ9XRFXSHKLYAiHw6AYH9eg4=;
        b=acez2TYrKjLcM6fHHA1JZFRJ/6TcyReq5ocfbJ6SQTOYurO94ARy2AyvvCZHBlVItP
         QWfrLmdsKIKO09TBKLvslpy4E/x7owIZhMMSjeumaktGpQ5iFI0qfngXYMPn30xD9r/r
         81Z/EtdEAOs2VRsOzu29mvGEiWkzd2WTWcmFJIERa5bJhHdwLaBqe9tSuOfm/aSOFZW+
         v6PXwFlFDrpuy716ssq8hXFXqggc4pDgN1DSn3R9udHMP7KQWdDU3c8TJMfvbZyHO4ov
         v0FvSvxb+kG84QYM3e7gcu2fmJo7QTjvHDsekOhyey0/I8LYfcymtpvzJr78W9kz1uT9
         A4bw==
X-Forwarded-Encrypted: i=1; AFNElJ829jTXKtuowejjrvVkSln400s89TBGNOEtqUFQrVL4E0E8r3XGEAlOgcMjc7HZe5yB4FQOc+pvvAc=@lists.linux.dev
X-Gm-Message-State: AOJu0YwbrrTdcTp8bL1VMnw5IopGH3hpqoRGQQOL+8SYFXqpEQ2/v+B9
	4/QJ5zqFKLpTPcKwsgnq9jSajfKJKdO18scN0CtYkRz7grKY25ogJfduVNuBDgssNoo=
X-Gm-Gg: AeBDietF2qLJHtiZ/R8t6jtgkFpRr7RNnS3a78y7C6k3Px6+byUtbqGdf5iJDcOFc08
	dIMw/VerMHNF1BEh73/nPe9NhVAZkt3AaoCpcxCYOF0f39B0YT+ifoN7qJ8QMMh/KgJazYKFu7G
	LmNIg9wDfJRmioZ1FYHp97Pk/C5J3BNRUzUnG3kbVTQNrMDwUgJ0kKGY+4+q9V5PiJfs0UIs5qt
	pYmTrxCIo47Br5+tmbU+Zopk3j790lpikdwIo8HXl9cPza9zq7rrmQw8kocT1Rg8M+cRWhTy6aP
	EovT9sbHHN+mZ++TiJIYZxrA4icvrksIl3WP7g5m5vyYfImcB4CdryrrIkyrMzRG/hXFSXLwTq5
	LULdZHWr4M91IImD2gvUspLWeXVLVoy8DHo0IkipHbGZE87NzbxjfWRjIfrbrTqhRFyBid3KvoX
	W6LucuS4U+ljT336u2+VQM163+/s5/BXy0u5+qxYqWj21P3r3PnsaJuDxxDqUsp7ZJ8ZFRnUAUL
	bw7pZk5L6jJpKnmujHsggNAaJmqB4w6F/r2
X-Received: by 2002:a05:600c:628e:b0:48e:60a3:220a with SMTP id 5b1f17b1804b1-48e60a32224mr33559005e9.0.1778163825055;
        Thu, 07 May 2026 07:23:45 -0700 (PDT)
Received: from localhost (p200300f65f114e08e9fd60f450b139aa.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:e9fd:60f4:50b1:39aa])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-48e538a8159sm137501655e9.6.2026.05.07.07.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 07:23:44 -0700 (PDT)
Date: Thu, 7 May 2026 16:23:43 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Michael Grzeschik <mgr@kernel.org>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Vincent Mailhol <mailhol@kernel.org>, 
	Krzysztof Halasa <khc@pm.waw.pl>, Johannes Berg <johannes@sipsolutions.net>, 
	Steffen Klassert <klassert@kernel.org>, David Dillow <dave@thedillows.org>, 
	Ion Badulescu <ionut@badula.org>, Mark Einon <mark.einon@gmail.com>, 
	Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Manish Chopra <manishc@marvell.com>, Potnuri Bharat Teja <bharat@chelsio.com>, 
	Denis Kirjanov <kirjanov@gmail.com>, Jijie Shao <shaojijie@huawei.com>, 
	Jian Shen <shenjian15@huawei.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Fan Gong <gongfan1@huawei.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Mark Bloch <mbloch@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Yibo Dong <dong100@mucse.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, Jiri Pirko <jiri@resnulli.us>, 
	Francois Romieu <romieu@fr.zoreil.com>, Daniele Venzano <venza@brownhat.org>, 
	Samuel Chessman <chessman@tux.org>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Kevin Curtis <kevin.curtis@farsite.co.uk>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Kees Cook <kees@kernel.org>, 
	Aleksandr Loktionov <aleksandr.loktionov@intel.com>, Thomas Gleixner <tglx@kernel.org>, 
	Jacob Keller <jacob.e.keller@intel.com>, Thomas Fourier <fourier.thomas@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Kory Maincent <kory.maincent@bootlin.com>, 
	Zilin Guan <zilin@seu.edu.cn>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Marco Crivellari <marco.crivellari@suse.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	David Arinzon <darinzon@amazon.com>, Yeounsu Moon <yyyynoom@gmail.com>, 
	Denis Benato <benato.denis96@gmail.com>, Yonglong Liu <liuyonglong@huawei.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Randy Dunlap <rdunlap@infradead.org>, 
	Yicong Hui <yiconghui@gmail.com>, MD Danish Anwar <danishanwar@ti.com>, 
	Nathan Chancellor <nathan@kernel.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, 
	Larysa Zaremba <larysa.zaremba@intel.com>, Ian Lin <ian.lin@infineon.com>, 
	Colin Ian King <colin.i.king@gmail.com>, Double Lo <double.lo@cypress.com>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-can@vger.kernel.org, linux-parisc@vger.kernel.org, 
	intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org, oss-drivers@corigine.com, 
	linux-wireless@vger.kernel.org, brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH net-next v2 1/2] net: Consistently define pci_device_ids
 using named initializers
Message-ID: <afyfa4E4rNbkMYTk@monoceros>
References: <cover.1778149923.git.u.kleine-koenig@baylibre.com>
 <76da4f44d48bdde84580963862bf9616bee5c9e9.1778149923.git.u.kleine-koenig@baylibre.com>
 <20260507-healthy-gainful-fox-500552-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2r3luua3e55dgqvk"
Content-Disposition: inline
In-Reply-To: <20260507-healthy-gainful-fox-500552-mkl@pengutronix.de>


--2r3luua3e55dgqvk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next v2 1/2] net: Consistently define pci_device_ids
 using named initializers
MIME-Version: 1.0

Hello Marc,

On Thu, May 07, 2026 at 12:55:45PM +0200, Marc Kleine-Budde wrote:
> > +	}, {
> >  		/* ASEM Dual CAN raw -new model */
> > -		ASEM_RAW_CAN_VENDOR_ID, ASEM_RAW_CAN_DEVICE_ID,
> > -		ASEM_RAW_CAN_SUB_VENDOR_ID, ASEM_RAW_CAN_SUB_DEVICE_ID_BIS,
> > -		0, 0,
> > -		(kernel_ulong_t)&plx_pci_card_info_asem_dual_can
> > +		PCI_DEVICE_SUB(ASEM_RAW_CAN_VENDOR_ID, ASEM_RAW_CAN_DEVICE_ID,
> > +			       ASEM_RAW_CAN_SUB_VENDOR_ID, ASEM_RAW_CAN_SUB_DEVICE_ID_BIS),
> > +		.driver_data =3D (kernel_ulong_t)&plx_pci_card_info_asem_dual_can,
> >  	},
> > -	{ 0,}
> > +	{ }
>=20
> Nitpick: can you convert the terminating entry to follow the same style
> as the rest of the driver:
>=20
> diff --git a/drivers/net/can/sja1000/plx_pci.c b/drivers/net/can/sja1000/=
plx_pci.c
> index a03553b80a5d..d69ff0ccfd94 100644
> --- a/drivers/net/can/sja1000/plx_pci.c
> +++ b/drivers/net/can/sja1000/plx_pci.c
> @@ -353,8 +353,8 @@ static const struct pci_device_id plx_pci_tbl[] =3D {
>                  PCI_DEVICE_SUB(ASEM_RAW_CAN_VENDOR_ID, ASEM_RAW_CAN_DEVI=
CE_ID,
>                                 ASEM_RAW_CAN_SUB_VENDOR_ID, ASEM_RAW_CAN_=
SUB_DEVICE_ID_BIS),
>                  .driver_data =3D (kernel_ulong_t)&plx_pci_card_info_asem=
_dual_can,
> -        },
> -        { }
> +        }, {
> +        }
>  };
>  MODULE_DEVICE_TABLE(pci, plx_pci_tbl);

After the conversation in the v1 thread it was unclear to me if you
stand by your opinion, so I kept the format as it was. I interpret your
repetition of the nitpick as request to rework the can drivers for the
next revision (if that happens).

Best regards
Uwe

--2r3luua3e55dgqvk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmn8oGwACgkQj4D7WH0S
/k5magf/eyQ23u39ybxkW2OdbwK59q0fpRutP/sxrKWuT6tv8V2fFyOeuGTCjF38
S+nSwmuH/rU1tyi6cJiCBx8U/lrBqlri55tfqDeMMmEdaTgDx/f8rLh5gw/OXR6w
iiW3jwdOchqKMQAWW0XFekrRumOxBYByCEve5jEyzQwjs4cggMP+GUBgYLi9VMsu
p0EMeC469BJE9KTtF0MQoLVR4xXQebXlYBWyCtn6NXuHOWYlZbFW4NYx1YQADQGM
vg8UmTZiP5QB08RryLszWVJxAzMjkvPj8VPLDjxs5zDqJDt6Zbm3G+mNqj3JHLlV
t3qw6OQQis3J/F/BMUIXdtL08Ss0JA==
=i/K5
-----END PGP SIGNATURE-----

--2r3luua3e55dgqvk--
