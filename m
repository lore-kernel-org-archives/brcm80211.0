Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776596;
	b=mQOIwCOjUFLq/v7Lwu93Zns1r/2eSKLYvWxd6S1A01t/yFl8KxQvuplhBYfV4veHlehU
	 2Du6AbWYqRNyY5Bd/Q0i4okgeWJoZHqcOXFthNBG1G3t/tHYKM0FjIjyhZftdenBPYSoZ
	 KyqUwmds0GujlvmbpBmZPvuzB2oFRUXYImRlPOh+W0KKIzQZcdFZmbyMygdv5lQV4FhcI
	 AhRziFZT7p898k2dhR+SciWd6RcyKe32cOvfiOhph3PwomeFo7qzmtHBuywtccT8Jmr1Y
	 WgtkUZU4eyV/3oajD/3J5Y0piBPNR8HNvT2H2aw3SZ/ZfSisfrCOe0iY/Dr+Uwi+7tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776596;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=vHFgHSvHI5eSzCfUPZ2yIuU6Boys3jbWPHp1Mry95KY=;
	b=wnICdExRjM5fHOBcE1tPnbNyhxNIrgJQSioV2QH1+UdfseEDkJhZQSgMqLTPBzf9lJDg
	 ZPHmzRnVEa7mbyq5OUsnoGmSyk/UnZiJzMov6iNEVz8cWQypiuNW4a2hxc99exzK9ex1B
	 8bKcx40HpKT8kmgcdRYgNnNKnMLMx6tz0Vi5iWLj7LHtn1k+IX849b65qbQ0LYdOui1jZ
	 zDycQsxvsCvxwqdZRkEa4dAUX7BNwU7UNVf5zF5QBOmFg0ihipplKEJV5s0Gi19wrtPYw
	 9X+/JGpt3HF1UJhVVt5qxRIhJzibOWntpPhZhoRPkbJhYmUekYCwhVyQCjYZhOnc1Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WkOhyxy5;
	arc=none smtp.remote-ip=209.85.222.226
Received: from mail-qk1-f226.google.com (mail-qk1-f226.google.com [209.85.222.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A860606A33D
	for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 21:03:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A860606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=WkOhyxy5
Received: by mail-qk1-f226.google.com with SMTP id af79cd13be357-93f2f2edb19so320706285a.0
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:03:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794776594; x=1795381394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vHFgHSvHI5eSzCfUPZ2yIuU6Boys3jbWPHp1Mry95KY=;
        b=kG5lsCv0Cf++qA6sosP2k0Ki4DlAi9j0Sxxxkus8diwii/yDY9TSW/Bcb+4OTm3rnr
         G69jaVGZbQlRc2OCeW5hHPys64OlhxqpB2LSGDTrZNs2Vlzc/MG1GJ1l0J0NlQY9OI1E
         xStCEmpy/BBCWt0ocrWrdqrIiqu/vO4YhtovytWYt+uHt2F15Cn+b5oQGw6RGJiDg+WR
         YxY0BpIC9ml2zPD86HrgYXcEMYRpJ9ktxHZTWpC2Q92nSQKoeM/OTCmZ092pf1azuTF9
         9RjmE4POCyCUEJIm3nvhnHJuICkHayNp7lk7x//m0wYf0ch/A/P17xw7n4iPQxoOkS6f
         uU2w==
X-Forwarded-Encrypted: i=1; AL+hErGEUL919fdZFUlv4/8VNOSfPFthDiVCK4/fVB7QY+jN3rI6l+rAPkjrO3JG2180KHKuKjmOl6+Bf84=@lists.linux.dev
X-Gm-Message-State: APuU4Z8WmkssVGJFGuCrAw0Y4o+GsDuo3jlib87N6ZxJfhgOPZaIYWYx
	ov4GTsO6FUce8Px9Ft91RkfsoHBxx0Yt2mVWQFY0FfTL0YVT2PWSDTf1xs3eR908SgKwq6uL1DP
	HMQgFpUjcd/eQtBfO8gfcKNBFvWEl7qOJ8bzRGnL2GMQ3tE9Vd7HNv7gXWuCgRY7LcHhWJYjcfq
	MABuVYUTPH3YCz5RaaO46J+b6sWbgyWW00CSl3XYeVkmKS3M3pp9r/f2PH2GMhoazYop1xDQIfv
	c5bC9gFpE3O4xDCoKfWwQ==
X-Gm-Gg: AYBFou2j4GZkAIqFIE+l+6PUPpIimWNGisplyq+e3xo5Xu+FfoLQ5S/Enm/xNDB1l0j
	+Cx6cWzwxJJFloPVEKD4uBSY9Q5G+jBQBYbrGM0yXG/T9fJ2nt2CRTaal+bYwdaKw8fuxfcTOAX
	LDnufRBjbb4ujJBHrfuksvmydp14xOlSiR9tvRNrgN6PpXBvAtAUoghJtIUj0F8TOfKekcscjCV
	2Sq0Z21kvYzgsLlwHa/UIMlczOez6EjaBCcWHlusmY1A3Ez63PglXDd+w56nlBeGpKj2cE8Wqoc
	QSisE6BiM5zdOOsbTiuyHGywyc1oqkCyArGs+Ca6hPNUZjDKYTzrLx4jkDhsh+thfv15cH70pe2
	9VSEx9dF9/vkkI2UXSC0Xa0drQS1V6Y4na6tVkAuVvbpZTN+Z3svdaB/tpkFHUFWddwysY2dsX0
	mM67VkUPVXVHtploCBve7w818+
X-Received: by 2002:a05:620a:6ccd:b0:93c:6e1d:96af with SMTP id af79cd13be357-9494bc1b921mr1575588785a.49.1794776594311;
        Sun, 15 Nov 2026 13:03:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9494c7d3456sm103827185a.17.2026.11.15.13.03.13
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 15 Nov 2026 13:03:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37628596fc9so7597504eec.0
        for <brcm80211@lists.linux.dev>; Sun, 15 Nov 2026 13:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794776592; x=1795381392; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHFgHSvHI5eSzCfUPZ2yIuU6Boys3jbWPHp1Mry95KY=;
        b=WkOhyxy5+wAwpnpeTbv1tGSaIWwKxasGS/AWKFDqD2MXTEJOfqelb79dCtabD3L8sP
         ILo54nA+2CvksScgnHE5xWOPcwSdxRk4xdWP2ro+T470rAuyDBfxRt3rB4ayaogGBLak
         WZu7b21lV7ulpg766YvhWLbDfWE2zXdiSEVv8=
X-Forwarded-Encrypted: i=1; AL+hErH547kAuApJLipt/HnMZmFBbP6wAgqBeVfshhnuZ6R4dx4Cq9/fv+acb1L7ruMArMdjdR22P06WCUY=@lists.linux.dev
X-Received: by 2002:a05:7300:d946:b0:36e:2626:4ace with SMTP id 5a478bee46e88-3796365edc4mr9383050eec.5.1794776591924;
        Sun, 15 Nov 2026 13:03:11 -0800 (PST)
X-Received: by 2002:a05:7300:d946:b0:36e:2626:4ace with SMTP id 5a478bee46e88-3796365edc4mr9383015eec.5.1794776591057;
        Sun, 15 Nov 2026 13:03:11 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379565d3e37sm31068797eec.24.2026.11.15.13.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 13:03:10 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Aditya Garg <aditya.garg@linux.dev>
Cc: Johannes Berg <johannes@sipsolutions.net>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Andre Eikmeyer <dev@deq.rocks>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: pcie: Make antenna SKU check optional for Apple boards with BCM4364/3
Date: Sun, 15 Nov 2026 22:02:53 +0100
Message-ID: <20261115210253.883721-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111141756.11564-1-aditya.garg@linux.dev>
References: <20261111141756.11564-1-aditya.garg@linux.dev>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 11 Nov 2026 19:47:56 +0530, Aditya Garg wrote:
> On iMacPro1,1, iMac19,1 and iMac19,2, the Antenna SKU property required
> for firmware selection is not advertised by ACPI. It has been found that
> the firmware shipped by macOS for the BCM4364/3 chip is independent of
> the Antenna SKU property by comparing SHA256 sums. Thus, for this chip,
> make its requirement optional and use it only if ACPI advertises it.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Aditya Garg <aditya.garg@linux.dev>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/pcie.c    | 61 ++++++++++++++--------
>  1 file changed, 38 insertions(+), 23 deletions(-)
