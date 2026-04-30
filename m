Received: from mail-yx1-f98.google.com (mail-yx1-f98.google.com [74.125.224.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 222337262A
	for <brcm80211@lists.linux.dev>; Thu, 30 Apr 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777562098; cv=none; b=ThgeHJNf0jt6bjhr4vF9NrnLejXu6kax6WUxzF/oAQpHr1+KbZ7RyVWtsBTh9vtmYQjXIqjcmwT6qE3ma3/RffNJ/SEGJZCq+1fN5lZCGQ+oF+lZHcKNMSiOlqeZwmsRWL0hhqWBQAsRmYPpOayPjWNXUks5uWn2LguDcsgkbs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777562098; c=relaxed/simple;
	bh=jfvurasXyO172rf8RueovQ21HocKi4qC6cmZUk6WC5A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dgTCGWDfU9uRlu5Lqsoyjt0YKiRmUvbDU9o6ZGMz4n5Jw/JMUn60WPcExy7yt0AmY+j7aJ53UhhRR31vHVuLI2HNcmgUOeH/ZwdogZH7H9+Bc1lNAANxv8QoulPw0QWaTSCs9K73KW6HW2ox8XC5iVPpl7WMDIFKD/URmgx8EJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=VaH8H5Gy; arc=none smtp.client-ip=74.125.224.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="VaH8H5Gy"
Received: by mail-yx1-f98.google.com with SMTP id 956f58d0204a3-6501d242e3fso915933d50.0
        for <brcm80211@lists.linux.dev>; Thu, 30 Apr 2026 08:14:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777562096; x=1778166896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j6W7N3TF0u0m9VhuQZcYonFJHVZpaP1eZOWODDM2/uM=;
        b=AP6SjrkPbp5EG0hIdwrlnGsLiEt8Lp5mom/31nzbpMidGHsFALRFy4q4TXMiTXh2Dz
         zf+UI2j1V61Z8GHeeeeAiVFfkg+eGFvBhLc6ntCSnqxd4e0Hfg8HeYhJQAlur8LP6o2P
         QkSbZkL1sGSTlQIJ7yJxvBXITc/8nhqRKSbfFPt+KV4smVdRI2o+o4GsjJDvAOOOwAgS
         cUKjbIRUgIiW3VxVCIKaxLIDBJ1fzpoGFAZOD289XBchm8jDrqn7ftGuPVuzB7NQS3Dx
         6fYLzj8mVU/gzJqmOaDBygrOI+3RalntzFg0UtcRB0A7QDK+XxHK+0Yc1cjP2kwUWo1+
         74CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+sVDck2qRd++HoLO7h4wvYuC+ZzVaYeYCQgyYKYqax1GSzCijyMmdVREbteL1VSHXw7Sz2/7rIRLo=@lists.linux.dev
X-Gm-Message-State: AOJu0YwQ6Jy1RVs++HoyKgYtU8p7KAJ0pz9YKC1xgdmRpb+Cv5QBPDNj
	Q/2DreEIhMNB6RVFXT3G93myXBjS65V+rwUazS4aKJcriUgBXkax0wo14ugp5mDD7Osii6sZ4ah
	a73HVCLgK718225ScMn3AyvZcsVT+Lbp7uWt5SBokwQuPNdrJ2T41DSr2TRSAMFxDrPpeTauSwD
	QlSxTkr6PhBHqMdbdNUZ+HzZMgxFdflaZCRR54eZiKnTrdWgCjtoE55G5MAo/raPe8B0fvUVcXA
	F1RBO+PSw1aUX3+iYaz+w==
X-Gm-Gg: AeBDietjZSfJ58hW8uxK0e0GXmDPkC+FjYf4N6MRtvU7OeGa65SbxVnJrDL4wYr/8dK
	NbN0Nv5onQ1TasU6trDSf7wm/U6dbvXavqtViFwgNm0Q4YycFC1B+nmdpe6K/+YQxnp6mJ0P1r5
	OKWhj4vNEKxJy33TV5f94fOp4Ubx2eEMPGOXKWEl7wvLH1Dx2gjjkHpKV4RYEWQ5gXsE/Ql9guL
	PlsFGupGB9OG2y9KmDcx/tO+sC4SeT09jDQq/nWrrBp5FB/6FSoejaEXYNsKqTxzwC7i5QTY4ZR
	/S3ByxrCztE+ZjzBUuyBHVFC++xerrvTFUdkVdwQg3cxIbvQG45SUQhYjXNQPxqUw3Vd2pT1qzH
	1O+VqoDeyTNnCFD8wB/KGlBFi5ODJVO6mv/qLi3BK+o0gdEjE3dK2ig+H8IDOxM83KtjQ4NYcsN
	8ks8a5kalEEQeFQxQUZgo=
X-Received: by 2002:a53:ac08:0:b0:651:92cb:7157 with SMTP id 956f58d0204a3-65c18de3e3fmr2287566d50.36.1777562095775;
        Thu, 30 Apr 2026 08:14:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id 956f58d0204a3-65bff2c83b5sm373877d50.0.2026.04.30.08.14.55
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:14:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-2cc75e79b97so2967787eec.1
        for <brcm80211@lists.linux.dev>; Thu, 30 Apr 2026 08:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1777562094; x=1778166894; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j6W7N3TF0u0m9VhuQZcYonFJHVZpaP1eZOWODDM2/uM=;
        b=VaH8H5Gyckz6ZGPPm3FTX5A7TvLDfnDDn3FB7+w7qU49pUpAut+bOlv6wpTOxm2inp
         W3fAuOF0K0uzxnFw3kc9/pjWahuMqqUy7zEu/ijg5Yv08ZZRMpS8m5EM1/VYg1w2w3+C
         VJZ9pu3Te2bQ94azDm9SOheIbABlRorGW+Gec=
X-Forwarded-Encrypted: i=1; AFNElJ9ccLFIhXl+myDWegMrLAkWZBXM5rnUG5KdoAzhhLynWxyGiwYgLkggOsNc8zfS2xw+BkTCZwguftE=@lists.linux.dev
X-Received: by 2002:a05:7300:fd03:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-2ed3e386a41mr1602845eec.28.1777562094291;
        Thu, 30 Apr 2026 08:14:54 -0700 (PDT)
X-Received: by 2002:a05:7300:fd03:b0:2d9:7bc4:9578 with SMTP id 5a478bee46e88-2ed3e386a41mr1602745eec.28.1777562093564;
        Thu, 30 Apr 2026 08:14:53 -0700 (PDT)
Received: from [192.168.178.26] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee38e71ccesm286774eec.10.2026.04.30.08.14.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 08:14:52 -0700 (PDT)
Message-ID: <f817f781-43d5-40d0-9352-20769d9a6601@broadcom.com>
Date: Thu, 30 Apr 2026 17:14:36 +0200
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: Consistently define pci_device_ids using
 named initializers
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?=
 <u.kleine-koenig@baylibre.com>,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
 <mailhol@kernel.org>, Krzysztof Halasa <khc@pm.waw.pl>,
 Johannes Berg <johannes@sipsolutions.net>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>,
 Steffen Klassert <klassert@kernel.org>, David Dillow <dave@thedillows.org>,
 Ion Badulescu <ionut@badula.org>, Mark Einon <mark.einon@gmail.com>,
 Rasesh Mody <rmody@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
 Ido Schimmel <idosch@nvidia.com>, Sudarsana Kalluru <skalluru@marvell.com>,
 Manish Chopra <manishc@marvell.com>, Potnuri Bharat Teja
 <bharat@chelsio.com>, Denis Kirjanov <kirjanov@gmail.com>,
 Jijie Shao <shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>,
 Cai Huoqing <cai.huoqing@linux.dev>, Fan Gong <gongfan1@huawei.com>,
 Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Tariq Toukan <tariqt@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>,
 Petr Machata <petrm@nvidia.com>, Yibo Dong <dong100@mucse.com>,
 Simon Horman <horms@kernel.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 nic_swsd@realtek.com, Jiri Pirko <jiri@resnulli.us>,
 Francois Romieu <romieu@fr.zoreil.com>, Daniele Venzano
 <venza@brownhat.org>, Samuel Chessman <chessman@tux.org>,
 Jiawen Wu <jiawenwu@trustnetic.com>, Mengyuan Lou
 <mengyuanlou@net-swift.com>, Kevin Curtis <kevin.curtis@farsite.co.uk>,
 Stanislav Yakovlev <stas.yakovlev@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, Kees Cook <kees@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Thomas Fourier
 <fourier.thomas@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Kory Maincent <kory.maincent@bootlin.com>, Zilin Guan <zilin@seu.edu.cn>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Jacob Keller <jacob.e.keller@intel.com>, Philipp Stanner
 <phasta@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Yeounsu Moon <yyyynoom@gmail.com>, Denis Benato <benato.denis96@gmail.com>,
 Peiyang Wang <wangpeiyang1@huawei.com>, Yonglong Liu
 <liuyonglong@huawei.com>, Andy Shevchenko <andriy.shevchenko@intel.com>,
 Yicong Hui <yiconghui@gmail.com>, Randy Dunlap <rdunlap@infradead.org>,
 MD Danish Anwar <danishanwar@ti.com>, Nathan Chancellor <nathan@kernel.org>,
 Sai Krishna <saikrishnag@marvell.com>,
 Ethan Nelson-Moore <enelsonmoore@gmail.com>,
 Larysa Zaremba <larysa.zaremba@intel.com>, Joe Damato <joe@dama.to>,
 Double Lo <double.lo@cypress.com>, Chi-hsien Lin
 <chi-hsien.lin@cypress.com>, Colin Ian King <colin.i.king@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-can@vger.kernel.org, linux-parisc@vger.kernel.org,
 intel-wired-lan@lists.osuosl.org, linux-rdma@vger.kernel.org,
 oss-drivers@corigine.com, linux-wireless@vger.kernel.org,
 brcm80211@lists.linux.dev, brcm80211-dev-list.pdl@broadcom.com
References: <20260428171845.2288395-2-u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Arend van Spriel <arend.vanspriel@broadcom.com>
In-Reply-To: <20260428171845.2288395-2-u.kleine-koenig@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On 28/04/2026 19:18, Uwe Kleine-König (The Capable Hub) wrote:
> ... and PCI device helpers.
> 
> The various struct pci_device_id arrays were initialized mostly by one
> the PCI_DEVICE macros and then list expressions. The latter isn't easily
> readable if you're not into PCI. Using named initializers is more
> explicit and thus easier to parse.
> 
> Also use PCI_DEVICE* helper macros to assign .vendor, .device,
> .subvendor and .subdevice where appropriate and skip explicit
> assignments of 0 (which the compiler takes care of).
> 
> The secret plan is to make struct pci_device_id::driver_data an
> anonymous union (similar to
> https://lore.kernel.org/all/cover.1776579304.git.u.kleine-koenig@baylibre.com/)
> and that requires named initializers. But it's also a nice cleanup on
> its own.
> 
> This change doesn't introduce changes to the compiled pci_device_id
> arrays. Tested on x86 and arm64.

for brcmfmac change...

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
> ---
[...]

>   .../broadcom/brcm80211/brcmfmac/pcie.c        |  17 +-
>   drivers/net/wireless/intel/ipw2x00/ipw2200.c  |  52 +-
>   69 files changed, 1308 insertions(+), 1101 deletions(-)
