Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90C46401A38
	for <brcm80211@lists.linux.dev>; Thu, 30 Apr 2026 13:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777554913; cv=none; b=bilBFCqOH7zjrkozrT9ZMLQMW6ylFRMER13myWIYZ0gSdwhTqOWYwT/RAWH82bDrYDDt406qynqOGdQIIsf9A/8Wq2ZCPs5vSGXw53/ap9luAI3VVYjJvWxwBWLmcvatr7Ls0DO8el5LEEy48K4hqquPA7z8Lkc10e8D33OMNAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777554913; c=relaxed/simple;
	bh=k6Ky8SekzqlEMWe2IfF4o9e521vL5c/R7nKtlYixpPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c1yc1VvPetGT9ekRpUWRyUKbUn2slEMfhYGVhfbjMMRgC16fxInlCT2I0/lVXnfCFpV+K4k89+ABkL1HYqLD3hLs4Rl3BmKeL3+6UNZcIWSy39Nmk3QJW6Od6xe6+i83HxU/rEm6w+4FjVIw2sZgCQvcRgWBIqbYtbsPhqdcBT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b=lrVUzEQt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20251104.gappssmtp.com header.i=@baylibre-com.20251104.gappssmtp.com header.b="lrVUzEQt"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-488d2079582so9328165e9.2
        for <brcm80211@lists.linux.dev>; Thu, 30 Apr 2026 06:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1777554910; x=1778159710; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q14Nfv+UEqF4wGTpTXYwRmNvMzztXWMPU3JKrPL0wNU=;
        b=lrVUzEQtwJpa8qpxe9jJFywb/+BO0GoRPCbpCwEf54ypCQeIe3F5dBdDaAkaFyp/1d
         FTDV5JhRQfnIHvurTg30BV5rZhAZL9IcYQoa9wYfuG9xCXa1oeZGD2LhAzcEZaoI/n5p
         jn26GWfz/0ezA75/YJMtjsGGpmGWNZHDZ2RwelsRskWa5F4TFaaxby8s3aNoEjspARYK
         kHTHXPYmuvCBcNM4/ufjVq2QiTmJuoYdRiRvct5jNY45LUxmQMBnzUU4iS35WpHZRcSY
         oEUhJOH3PSru1Qr8rH4cqkBhqSj+P3+Q7KsfRmGHY136VRyQopaS7sGIcsUldQ5DHja7
         MQ2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777554910; x=1778159710;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q14Nfv+UEqF4wGTpTXYwRmNvMzztXWMPU3JKrPL0wNU=;
        b=Cr36DcHtnso6LfktAdp5VlhNJ6L5p7ouDv35LipSFrA05+hmnKzlnQ4WYTFbpIRGn7
         gFnfL0LgEkLimvaeOR/lY3VrU1bU/g3+RmHH6x0oTm2ZzUMUmrahhz9urgZY2wnuvAVy
         +SH6AYmX5EK1wSWQg8GXw7nV+7MSJTmXI8aHiKYWEN41spUjsBxxAz+goyDFpWQoUSNt
         nbF2WFnjWbt1ZcB/9O1d/MOF9Ldmk5CyUwOlEU9Vjr78ZnVDEwSaviICnPubG3fTKE0Y
         aPASYZEW+X//Eyc5wxkfTg8qlc/ouM6zo3PjTC7/HZQU1R6cJnuHKRN6RiWvrAt5Ql1h
         zb6A==
X-Forwarded-Encrypted: i=1; AFNElJ8b69JzG9I2/LZvORvIerdWSOHexx/vdw0GV9i2F1h4dO9i+Uc8b/fir/feyuguubuRAUd+MbBYvXM=@lists.linux.dev
X-Gm-Message-State: AOJu0YysfSBzZMSgEZULhzvQGr3/zKTBNHHMGv/Y6YK5/uGjKf0FnKME
	gYtSLEM+vSSGvubRFW5cGxBAPOu2Y/IKTC+Cc26jGz4+j6KSmiPw6BrQDYMc21Pe2kw=
X-Gm-Gg: AeBDiesyTSmxBG8slvoK9hD5R6qxJrOLcqzQ8uswxPRdAhQM7greWOfoDuZGpxzVAfR
	PsEJ3U5ekB5ch8pvkaYydAh5xVOc89ZYuTtoZzWojrl/sWfatDpzOW3fXZ6GwBTOcqZ/I36QWU/
	aoLp1iLT/wH0zo93GfgQUPcbLFsukq/unXrLUTC1d+dPsdEX3vDeul/lDsVR9Ov4MEx3xd259DO
	kSFl0qw+8q5ysCcdWGZAlD0vB827sr/nMKQGMpBJIZrjLfLwNHH5OOHBSDMa40DhI37ToHLRuiq
	YbpDIDk1PZAVAreFM5vlDThzJtUE0ebpJUJAJskelhx/DagqYkCX0q/tiJ+594AYs7TbLgLr6xe
	yGbAHP6gqcMkBdd7lAW/hFN73bNRS9S3PW/mrpjqvZ0yqH628EVqzlFbi9CULyXD4Y0wlTA+kS+
	LdhNlFkifr7/ZdQ+LzVyDxgQCtAoIYmbebj4py087RkPSL0+EY56UFSuXaVXUrgVOkfcznJJBlH
	uliNXLCTbl/2a7eoQRYSwwcVg==
X-Received: by 2002:a05:600c:c0db:b0:489:284:44ab with SMTP id 5b1f17b1804b1-48a83f6b306mr35501805e9.12.1777554909754;
        Thu, 30 Apr 2026 06:15:09 -0700 (PDT)
Received: from localhost (p200300f65f114e0859f76ff87a50eb14.dip0.t-ipconnect.de. [2003:f6:5f11:4e08:59f7:6ff8:7a50:eb14])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-447b3d47ff1sm13921904f8f.6.2026.04.30.06.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 06:15:08 -0700 (PDT)
Date: Thu, 30 Apr 2026 15:15:07 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Michael Grzeschik <m.grzeschik@pengutronix.de>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Marc Kleine-Budde <mkl@pengutronix.de>, 
	Vincent Mailhol <mailhol@kernel.org>, Krzysztof Halasa <khc@pm.waw.pl>, 
	Johannes Berg <johannes@sipsolutions.net>, Steffen Klassert <klassert@kernel.org>, 
	David Dillow <dave@thedillows.org>, Ion Badulescu <ionut@badula.org>, 
	Mark Einon <mark.einon@gmail.com>, Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com, 
	Manish Chopra <manishc@marvell.com>, Potnuri Bharat Teja <bharat@chelsio.com>, 
	Denis Kirjanov <kirjanov@gmail.com>, Jijie Shao <shaojijie@huawei.com>, 
	Jian Shen <shenjian15@huawei.com>, Cai Huoqing <cai.huoqing@linux.dev>, 
	Fan Gong <gongfan1@huawei.com>, Tony Nguyen <anthony.l.nguyen@intel.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, 
	Mark Bloch <mbloch@nvidia.com>, Ido Schimmel <idosch@nvidia.com>, 
	Petr Machata <petrm@nvidia.com>, Yibo Dong <dong100@mucse.com>, Simon Horman <horms@kernel.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, nic_swsd@realtek.com, Jiri Pirko <jiri@resnulli.us>, 
	Francois Romieu <romieu@fr.zoreil.com>, Daniele Venzano <venza@brownhat.org>, 
	Samuel Chessman <chessman@tux.org>, Jiawen Wu <jiawenwu@trustnetic.com>, 
	Mengyuan Lou <mengyuanlou@net-swift.com>, Kevin Curtis <kevin.curtis@farsite.co.uk>, 
	Arend van Spriel <arend.vanspriel@broadcom.com>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Kees Cook <kees@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Thomas Fourier <fourier.thomas@gmail.com>, Ingo Molnar <mingo@kernel.org>, 
	Kory Maincent <kory.maincent@bootlin.com>, Zilin Guan <zilin@seu.edu.cn>, 
	Marco Crivellari <marco.crivellari@suse.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Jacob Keller <jacob.e.keller@intel.com>, Philipp Stanner <phasta@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Yeounsu Moon <yyyynoom@gmail.com>, 
	Denis Benato <benato.denis96@gmail.com>, Yonglong Liu <liuyonglong@huawei.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, Yicong Hui <yiconghui@gmail.com>, 
	Randy Dunlap <rdunlap@infradead.org>, MD Danish Anwar <danishanwar@ti.com>, 
	Nathan Chancellor <nathan@kernel.org>, Sai Krishna <saikrishnag@marvell.com>, 
	Ethan Nelson-Moore <enelsonmoore@gmail.com>, Larysa Zaremba <larysa.zaremba@intel.com>, 
	Joe Damato <joe@dama.to>, Double Lo <double.lo@cypress.com>, 
	Colin Ian King <colin.i.king@gmail.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-parisc@vger.kernel.org, intel-wired-lan@lists.osuosl.org, 
	linux-rdma@vger.kernel.org, oss-drivers@corigine.com, linux-wireless@vger.kernel.org, 
	brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH net-next] net: Consistently define pci_device_ids using
 named initializers
Message-ID: <afNVhCLPqPf-OKK3@monoceros>
References: <20260428171845.2288395-2-u.kleine-koenig@baylibre.com>
 <DI6D3JVJ6JG6.8V4XUVGJA2D4@baylibre.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6b5ffjhgb6zy7r2y"
Content-Disposition: inline
In-Reply-To: <DI6D3JVJ6JG6.8V4XUVGJA2D4@baylibre.com>


--6b5ffjhgb6zy7r2y
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH net-next] net: Consistently define pci_device_ids using
 named initializers
MIME-Version: 1.0

Hello Markus,

On Thu, Apr 30, 2026 at 10:55:14AM +0200, Markus Schneider-Pargmann wrote:
> On Tue Apr 28, 2026 at 7:18 PM CEST, Uwe Kleine-K=F6nig (The Capable Hub)=
 wrote:
> > diff --git a/drivers/net/can/m_can/m_can_pci.c b/drivers/net/can/m_can/=
m_can_pci.c
> > index eb31ed1f9644..cb9335c1d3ea 100644
> > --- a/drivers/net/can/m_can/m_can_pci.c
> > +++ b/drivers/net/can/m_can/m_can_pci.c
> > @@ -183,9 +183,9 @@ static SIMPLE_DEV_PM_OPS(m_can_pci_pm_ops,
> >  			 m_can_pci_suspend, m_can_pci_resume);
> > =20
> >  static const struct pci_device_id m_can_pci_id_table[] =3D {
> > -	{ PCI_VDEVICE(INTEL, 0x4bc1), M_CAN_CLOCK_FREQ_EHL, },
> > -	{ PCI_VDEVICE(INTEL, 0x4bc2), M_CAN_CLOCK_FREQ_EHL, },
> > -	{  }	/* Terminating Entry */
> > +	{ PCI_VDEVICE(INTEL, 0x4bc1), .driver_data =3D M_CAN_CLOCK_FREQ_EHL, =
},
> > +	{ PCI_VDEVICE(INTEL, 0x4bc2), .driver_data =3D M_CAN_CLOCK_FREQ_EHL, =
},
> > +	{ }	/* terminating entry */
>=20
> M_CAN_CLOCK_FREQ_EHL is basically hardcoded for all PCI devices since
> 2020. I don't think we need this driver data at all and can just drop it
> and use M_CAN_CLOCK_FREQ_EHL directly in the code for the frequency.
> Once a real new PCI device gets added we can see if and what driver_data
> is needed.

Sounds like a nice *separate* change, right?

Best regards
Uwe

--6b5ffjhgb6zy7r2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmnzVdgACgkQj4D7WH0S
/k4x3Af/edtfz9YYPFE6xum2g4TegCtLIvKw++0KDUAoyqpgkttjiVhQP2pkII1I
bwoXEDLgA701tfOm6K4xaBwmjr22fTEMmwqGBUUV9kbxJkZTOYaAvGL9vZUhumqW
aON4lzwvfmfJ4n1Nk/YWjSE0QmjI9PG7aoUCczzIPsEamTrS3xLh7OpHvF2bshFv
8t879m4kyInFizFXvDm3Pb+7WfqIwJHbJBKFtf3yy5ZlAf4JxFccVoOC3ygeZaz7
2S+yew8q9RxoAdReZzT/aUjlxkf0z4CmHidC1JcBK8qT/tAsE7w86uaDZOy5/ZKz
gpkzwoU/cOxmGkcr+S/smN1/kcOCJg==
=Kvic
-----END PGP SIGNATURE-----

--6b5ffjhgb6zy7r2y--
