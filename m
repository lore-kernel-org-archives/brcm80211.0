Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.228
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793714395;
	b=kzQjMpiSU0rf7hkjc9OHw/UPOTiW9+7uwqHy9NQycfkas9luWwW8bYwHiy2CVKVpDjyH
	 yIOlLF185d+boP5U3boVlEcHz6fEZgPW3HIviHoVnmdiv65wWl7q/fAlbC/kIkL6WbwmA
	 L7dZDRSZGdKcs3RDXtC37pamOhGm6V/qzW3bZ18H/yf7VSUMGTQ2XCIQ2OgKYz0QU0OKr
	 YYiTvxNyhZ3I7wTCSn6dob0QeDpEUrBmVhoNdRyezxBWBJP9Kt9x629TTxjktYMrIQbEM
	 R8qDKdcflB2YyRQ18JAO6UR7uTXreVmE2/vWOAEAFT/tZ1DSoua7xIsKYT75l0Tas8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793714395;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=FwIVVnYhvvjMTysTggNf76en9r3AUtCzAUuv63rWer0=;
	b=DzkDeX3KYrNgEJ4ibDKLsKSW4d+VMorBt+h4tG07FmBW/DZtrdZJd0Mlu0CRTujyM84j
	 dbojZzqTten83YT3vsLpPeialQ22IzQVVymkFlKL62ixxVTCLQEM6/FBZwels4F51ZjIQ
	 NdDjJjgNVVmsC3cWXooQ5xWz8WtrvlA8eGoafwifD1XADEixJMr4NCunPVSLPwfGuZd7J
	 CKtusS6i76BZpgtb7FUDuPQHJzFKmU9sQJdJTJg6Eb0hvyJRFnidn5gD8mQvmNvI3vzV4
	 X7OFVUxp8bYEvuU9pyIJPIGJD/Q4vfuxScB0BD17MlMxU/+1XQ94MjFYx8BcuTwyplA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GL9kYdLR;
	arc=none smtp.remote-ip=209.85.215.228
Received: from mail-pg1-f228.google.com (mail-pg1-f228.google.com [209.85.215.228])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6340606A331
	for <brcm80211@lists.linux.dev>; Tue,  3 Nov 2026 13:59:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6340606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=GL9kYdLR
Received: by mail-pg1-f228.google.com with SMTP id 41be03b00d2f7-cdab6ae1ee9so1745648a12.1
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793714394; x=1794319194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FwIVVnYhvvjMTysTggNf76en9r3AUtCzAUuv63rWer0=;
        b=0nsgPBKO4wbXWu3onY6BKVKSOWbkA9GDV4jpSvsKMfWaruU9OvDMvBJ4PlXji354W3
         POSmCx64S8SNXQ+b1c1y3fWfYi41A9d/GZ/NtBvQnFV/D9dGo0jSi8VYRCU/zB18PVyR
         NDrUFfsk5deziWFuj/pHLeg1x8JZnedpcQ1rWJmnii+23ks7RQ+1KV89gSFxtSKX9SRq
         O+XDJWY5YoZljXlPw86po++BH9KcUpVaE841uxG8OBPzXqfd5kgKdfPZAzOAdudFyu+t
         uYEKhkJ/MvHUrdeQA/2s41mkvhmKei9z4rIquOhLA3JOH7ED2DP7nrd46atF+cPZwy7C
         T07Q==
X-Forwarded-Encrypted: i=1; AKwUvBycxYfvMiwa4U64jobbIiBM3hUT0hTCGQsDY8gNJMs8v10Z+z2Vh9Y17SpUTUImhWMcGv+zinHcInU=@lists.linux.dev
X-Gm-Message-State: APuU4Z8fFHNjJR/JkXIXMEUJsQKT9y/13bmatTe2FKwDX+uWb0L01BR5
	NqPh5S/YvU0bbbXe2qQmfBuAE69R/i+JHVsLX3Q68vZvBKG7HSlwf1mzGIc9BApO2p54+F0oRy6
	9tI94JsfS3sEJqyoGzq+ZOZtVrJL2y58Jhwtax829Q3t+d5Thw9N31ZyaOH37Ky92Ik80+WiYTl
	qDUyxtfefcCPYhxbIaTx/jPRV24ewPI8KVPiJYfLQTRiuFLFFWgjt9AQ6eoIZYL07FKAvkyprbT
	qqca+cojBSi/ERTAVA=
X-Gm-Gg: AYBFou19ubkS/y7WI8TzYnV26tpIM/oh9LdaCQuT579zZ5wteQRqDZRVeUmof5YGz/9
	aDUSdF6SEGJsUxu1z6rX43mgRIOSV3esaSRd6uBAbLi6fMwGpRiN08rQCZLu6QYm0PDM6omlIpL
	+krE4Uz1WtKNu1JUOScftZ94VtAvL/Mu8dWHWvQA0jVpDInbReEZunsdK4VZRmzY3j8Zv2ZTmto
	vlpwTRufYXfeVb+1RlscNo0DngpMB5FPKhCL87kqCHMclyGpQNJ2FqTGorhVkDWZDHJosCT707u
	Yw3CpWoAJY6/RmW9ZyQ6WOUfXSzUWiZHIX1RS67zjnLSnvcijl8x9HWuXjULLN0NGIQtg9vtaR8
	SpxDC71VKv6bLg5b10bwiOHTQivOIItamba/lpL4oppXvEETF5gYgZ59xl5eXGCbCWt9Mo23IAa
	1dA5Qz01cwC5m9n7chrHC6ScFCLGDldlegt6WCNoo=
X-Received: by 2002:a17:90b:590d:b0:3ad:1da4:2ddf with SMTP id 98e67ed59e1d1-3ae8980ed29mr9761950a91.51.1793714394039;
        Tue, 03 Nov 2026 05:59:54 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b07cab84edsm1846296a91.7.2026.11.03.05.59.53
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Nov 2026 05:59:54 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1aa0fb7f157so6462992c88.0
        for <brcm80211@lists.linux.dev>; Tue, 03 Nov 2026 05:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793714392; x=1794319192; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FwIVVnYhvvjMTysTggNf76en9r3AUtCzAUuv63rWer0=;
        b=GL9kYdLR+D04yp/N5aQ3FVdJhZjaGIzFUaPvITs4nfkq9C3/X2xrVg8uRZ57bSPk7K
         qO4WAjHf70mBaJ6dEX5DYY3UrIbt7lqZw4y1jam7LVRW4tjtxTUnMdHPXuKngD0qtsBP
         7Sdk9IsP0w9/EmOzTxWGSILjuNPBuXW01pSTU=
X-Forwarded-Encrypted: i=1; AKwUvBy7SOXB/d2DDWig4QOxKdeAQOgVRpsLQdWCH/8FNfuse9eq/Bi60dIY+c3/uk9kugj6fBGArXcsL6o=@lists.linux.dev
X-Received: by 2002:a05:7023:a56:20b0:1b2:3742:828e with SMTP id a92af1059eb24-1b23742830emr5949717c88.3.1793714392062;
        Tue, 03 Nov 2026 05:59:52 -0800 (PST)
X-Received: by 2002:a05:7023:a56:20b0:1b2:3742:828e with SMTP id a92af1059eb24-1b23742830emr5949684c88.3.1793714391367;
        Tue, 03 Nov 2026 05:59:51 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac18458e07sm41658755c88.8.2026.11.03.05.59.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 05:59:50 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Michael Reeves <michael.reeves077@gmail.com>
Cc: Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	"Franky Lin (Zhenhui)" <frankyl@broadcom.com>,
	Mathy Vanhoef <vanhoefm@gmail.com>,
	Kalle Valo <kvalo@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	asahi@lists.linux.dev,
	Hector Martin <marcan@marcan.st>,
	Daniel Berlin <dberlin@dberlin.org>,
	Janne Grunau <j@jannau.net>,
	linux-kernel@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	linux-hardening@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH 13/13] wifi: brcmfmac: Add BCM4388 support
Date: Tue,  3 Nov 2026 14:58:54 +0100
Message-ID: <20261103135856.3676311-11-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260925-brcm4388-submit-v1-13-b5cbc2cde2fb@gmail.com>
References: <20260925-brcm4388-submit-v1-13-b5cbc2cde2fb@gmail.com>
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

On Fri, 25 Sep 2026 23:43:48 +1000, Michael Reeves <michael.reeves077@gmail.com> wrote:
> From: Hector Martin <marcan@marcan.st>
>
> Add BCM4388 firmware mappings, RAM base and OTP handling, and increase
> the RX posting and completion ring capacities to 2048 items.
>
> On BCM4388, DMA_FROM_DEVICE mappings for posted receive buffers cause
> DART read-permission faults followed by firmware DMA failure. Map these
> buffers with DMA_BIDIRECTIONAL to allow device reads as well as writes.
> Keep the existing mapping direction for other chips.
>

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Hector Martin <marcan@marcan.st>
> Co-developed-by: Michael Reeves <michael.reeves077@gmail.com>
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/chip.c      |  1 +
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.c    |  8 +++++---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/msgbuf.h    |  4 ++--
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/pcie.c      | 12 +++++++++++-
>  .../net/wireless/broadcom/brcm80211/include/brcm_hw_ids.h    |  2 ++
>  5 files changed, 21 insertions(+), 6 deletions(-)
