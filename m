Received: from mail-pl1-f225.google.com (mail-pl1-f225.google.com [209.85.214.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68ABC49DB91
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 20:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416298; cv=none; b=APHXBwZ59hp/ExDZrpHaPLKfTA/nBKSNE5ryqqp5twJwK4RmU+wMKHDHONlgMqaPW3o/mG2JPcJ3viuUj0FqkcUuq74nZpqBFM4i/RSwXZVyGAIT33hkk/BwiZWeZbYfErUa9JBZ82wUB+RN/zP/P+HJtqd5jibZbg3NWkkaWKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416298; c=relaxed/simple;
	bh=vQ5BcgY5sdG1CQBpmPGsw0919m9BDRY1Jb3LHemijU8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VeUo5UaRv0hLAOjszeLuYdOFX7mdlGtHLG4sXosjJyFFbp24GJl38tDd0flZbEMy0ccDbw5B8ZA6E2clsVhFGSJYPsCpDeLpsRs7DS9gXvj+v/fuDjx4SdcYjb21csDQxhJPpdK1CuJFd0ffLnJNoX4RFHd4pPFNCvX9X+wOE6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FuZvlUf+; arc=none smtp.client-ip=209.85.214.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FuZvlUf+"
Received: by mail-pl1-f225.google.com with SMTP id d9443c01a7336-2d9201076b3so16926555ad.0
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416297; x=1790021097;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HCcEwGsZkXP6qM0+jBu8phPLOnSGjxwqZlmClhGp2w=;
        b=cUFn516ROOZlo3nosKRr5dzJZdiyRR2wB1HaA03H3c8QKKxxbAk1Mq2AffzZuBi/OV
         d5me8tOM5Z1dDU8gjcotOKL6xsg1ByYCxKkYeLiQq9dPunTKI6ghe6FohQ6H+RcdxVCl
         qkUKmhdaSn6xp1CsLm1IbiXqqb+4q3Ljo7L87cKw8YBjgav0DfP/6aq+akuTc38cg0eJ
         mEqMpzOSdZ1poLsXd+KoH1oGfVS/5jVx5DXzwmbkGrpIVrShNKaLk6X3FsIJB6eWoSaZ
         kgbWhi/5R1RKt2d3rA59YtUHBeQcQ/MSHjZrN3zlVAOrf6RyWhBfht8PRT5syDFloKgL
         fw/w==
X-Forwarded-Encrypted: i=1; AKwUvBy4HCJAW6aLxrbDW8wcbHCX8CqQlmPX/yj16bbS43lNldTYk7vpZDBO76oES7ahZbGt9KvOuf7KE/4=@lists.linux.dev
X-Gm-Message-State: AFuF++mJhEGmyVEX9AUYozkgh0TYmoP1U4nd/2RmH20gQjzGz6GcxHtW
	bXZwHlqakp9akO9JzC1D3ha0eleX3DsNEDiHc4x7EbVyXD2Iift+zGbxSxFxJHI9lrjcdClllWJ
	p5xj/RSCSAj65SaQ6Pp+BAvSBifpkB3oax58Do6pF02M6+kSIdkxKkbXScSxOhFFOaLNbLTJZeW
	97mp7Ll5rRr6UNjRjBUaw6K4niGxMYwYeH54z0xxrYKbtcVVGdQ2E+sNaB9xnpdQdd1wm0TEmQp
	+umwL8ILw/HBhPsTlWzBA==
X-Gm-Gg: AYBFou0EnHA5BY1rdGErSWAd0CZoiHNPybG8Jm66eBnvN+ZTPMGXz55zqsjDbxjBoFv
	CI8iV4WGUtKptYQ5GTdDqpyyFXlxcpR7IKbLKurp6qav/28r2EEb4z7oefyZ7ucCnIsyga6byEx
	Q6x4lG4TnTwxE/km9Y5y5IqxwkGebUjdLf0hprm7zZqGyptqoVza6q1x4VZGj2vLeUz5bGn20v1
	XhZ8xFzWZRPxIOBT3XRe3gy4Nm4hqwO1SazjZAgJ2NNVb7UecFfesOg75DVaonQdSpSQ9ZBhjKN
	Yy8najHdKpB/nmbeG7CDQREUqzUeH62tBCjXZBHAZDLuVE5Eip1orL+msh8Ap8zRlLAFEJMidWW
	EEBidnBiwPueDWob/VHKkgDcpyjDw337oDu1N8FVGD86nIWde4sTZNWT2pvUgYTWVcEjBiJy33y
	wYIdSE/E66O1pR+A+URWR3i71dIXbFYSQWRvs7w0sbGg==
X-Received: by 2002:a17:90b:5806:b0:39d:f024:c7e2 with SMTP id 98e67ed59e1d1-39df024c8d5mr6334784a91.4.1789416296653;
        Mon, 14 Sep 2026 13:04:56 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39dfdacbab1sm285517a91.4.2026.09.14.13.04.56
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:04:56 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a0050a554so638044285a.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416295; x=1790021095; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HCcEwGsZkXP6qM0+jBu8phPLOnSGjxwqZlmClhGp2w=;
        b=FuZvlUf+7sG4qQ9bhXYPvfAAbAnQ9dKDiE/L6a09AO5DGKBowOx0R9f6jRbXBusVqN
         H4ZcYH7cGO0eSd6nX0VLnivow49t9Y0pPIbivHwD5V/W1u+XQ5kxX+QuHDv7AuduVaT/
         Mwe7MFaSf7EP7m/QXWyGqJL2cw8rTOz9yHy/E=
X-Forwarded-Encrypted: i=1; AKwUvBzr3x50nksoJP28QiFqpodxAmU3Q4y+F1L9ahk8HpTq4vcxQgnJUgM5r9ldLf1jGkCdoJtlazrLlus=@lists.linux.dev
X-Received: by 2002:a05:620a:2590:b0:93a:14c:3296 with SMTP id af79cd13be357-93a2985552emr600519985a.15.1789416295447;
        Mon, 14 Sep 2026 13:04:55 -0700 (PDT)
X-Received: by 2002:a05:620a:2590:b0:93a:14c:3296 with SMTP id af79cd13be357-93a2985552emr600505585a.15.1789416294251;
        Mon, 14 Sep 2026 13:04:54 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-939ebda519bsm1038790085a.26.2026.09.14.13.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:04:53 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Janne Grunau <j@jannau.net>
Cc: Hante Meuleman <meuleman@broadcom.com>,
	Gautam Shukla <gautams@broadcom.com>,
	Kalle Valo <kvalo@kernel.org>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	Jason Huang <jason.huang2@infineon.com>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: cfg80211: Report port_authorized for 4-way HS offload
Date: Mon, 14 Sep 2026 22:04:49 +0200
Message-ID: <20260914200449.1747117-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260912-brcmfmac-4way-handshake-offload-authenticated-event-v1-1-e41a6a8281a2@jannau.net>
References: <20260912-brcmfmac-4way-handshake-offload-authenticated-event-v1-1-e41a6a8281a2@jannau.net>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sat, 12 Sep 2026 11:40:51 +0200, Janne Grunau wrote:
> Since commit 416386060 ("Mark authorization completed on driver
> indication during 4-way HS offload") [0] wpa_supplicant expects
> NL80211_CMD_PORT_AUTHORIZED to complete the authentication when the
> driver supports 4-way handshake offload.

In brcmfmac for 4way offload the driver waits for two dongle events before brcmf_is_linkup()
returns true and subsequently brcmf_bss_connect_done() is called to inform wpa_supplicant. At
that time the supplicant did not rely on NL80211_CMD_PORT_AUTHORIZED.

[...]

> Link: https://github.com/zephyrproject-rtos/hostap/commit/41638606054a09867fe3f9a2b5523aa4678cbfa5 [0]
> Link: https://lists.infradead.org/pipermail/hostap/2024-August/042893.html [1]
> Link: https://bugzilla.redhat.com/show_bug.cgi?id=2302577 [2]
> Link: https://lore.kernel.org/linux-wireless/20260911065656.1269623-5-Jason.Huang2@infineon.com/ [3]
> Cc: stable@vger.kernel.org
> Fixes: b8a64f0e96c2 ("brcmfmac: support 4-way handshake offloading for WPA/WPA2-PSK")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/cfg80211.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
