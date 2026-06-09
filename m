Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6290359A6C
	for <brcm80211@lists.linux.dev>; Tue,  9 Jun 2026 14:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781016814; cv=none; b=md7gqdIIU9Yb9979QtYrd1z+buqs0msrz7nT2P8d1obSb6ZSdaU0/yXhhfAnToKl+A3zXmt4P40l7W8Vfcl9Khll3buv7q1cZRtu0LoAdYNoa/gafsyTIomEAMf4AV1XLpJrDNd4YTsNISGtNX30qSFhC4Ryj3Tyb0H4HPp8FSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781016814; c=relaxed/simple;
	bh=T5WTr7jmHvoqqrrXzwILgbWbeUmEOQN5/4IBCNi8Xy0=;
	h=From:To:CC:Date:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=SyhID2g/4Iu/WwKpMXS2BpFBSHf+VUiHXnl8wNMLSFjfkrbDMedO9Gved/2iXTXZqYYnInXBufUR6Z6slKx2BM3b2DYdexZAhcDR7yhtwkdWmK3zGMfnG12t8DRX8mTd3oA56irR/taYxsZooQJtfzt+WkWUUh67TvJnAl5KUSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=TxYC1h5j; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="TxYC1h5j"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2c0c2d8b95bso40406575ad.1
        for <brcm80211@lists.linux.dev>; Tue, 09 Jun 2026 07:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781016812; x=1781621612;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:dkim-signature
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d9nshAheis16fsfBtGYld+unMmzzCTRT676gO2+SBa4=;
        b=VyfbU4TtLO02ZdDHD9wZaIM5TmHo/UkzzY22nwiLseWkW3iNakeoRVjDnh0l38ee2I
         us42Gv8UxtagbcWARDSY65uwtfIOxz1hGUq6h9nkL2Zzib1C7VnV9mFEmY7do1nkAi6i
         mj4ta5FLiQMX8tYQKYgyaOwCF6fGw3+opEQ3DtR4IgLy1II/13+udq2ZZzh+c/af6g9I
         XR6zYnXrwSwbPCt0CEbBMxQDpQGDBIS16Ck+CFDleYDZR0weGsq88pxsyPXrNOYpMYFX
         RRXSE6b7Hkkx/c22N8X/3tU6NGMOKw/yKIwSjeDHP32QMsCgjmlLU6j1DYRWAj9yiX/H
         /QKg==
X-Gm-Message-State: AOJu0YzNZpB7PNspi2/UtOF6P8cevH9Da2kqclzlJOxjMQw6h+GQlPTb
	ufQ82KXgcy3mg9AFdyM7NAYiMIysvLE+u9uPlRHgN83Zz0K2N/d7Ac5Su1IQJb/h1SjRGw3UByK
	1tXKC9S7OATy/s/QZcI0nLhDuGa59f4nzTBCJUishR2Mdeb6qoSiS0nLVlmpDCivQx6r+y07gUL
	V5LzbN+Wlivjj9rIdXPXFl6r9BWFEC5VXZRRjCguDHN94OvYX0gplXqa108I8iMfg6w8kpcxCZ0
	fU3rwvMCeHNFZBoPn7p9Q==
X-Gm-Gg: Acq92OFa9GDmhN6eqGF8HwVfB84cEX4LHBRtcWn9hNsFVvYKoxvwkFpy/70USdQKYuw
	G2zE+uU4e5mprXP7tg0IkapcP04FKu5ILaSAOAeGHLDYGOxIuzlWKeePvjeAFKAvXC5Zjk0C/kV
	lZrHfVMresCUa+skOsb04ywpuSMUdTvHqW53wboUxiEE876j5X/bmReCl2dYy2YOZA8NyPZHxLC
	RJZiZXG8L+t0cgMqiYO1iQwk09Yn7cG5EHhpnkBcNGvCi2efcpR6YbJJsGRgaSAWn+un8KV4oPH
	+emWBFQsNti48lt2xhyHH8dw2LyIxIfYjZJweC3st4pYItrwKOjEr4cEh8eln/v4EF/t2rJpzZc
	eTvLENCML/c5KZwjX2UgLGZm272/mQOttSrVp/h1/vP2rxxyrVx+n/gPewsJZCKq4hDoODnaByw
	263HJW7LXwd7lEaT4lVYITo6ulEMEx56gRepqI2GjLsUtnuSrlYbR6hfrnkInB7oVp4FgR2ppF+
	Q==
X-Received: by 2002:a17:903:1246:b0:2c0:ccdb:e023 with SMTP id d9443c01a7336-2c1e83451a5mr238456625ad.17.1781016812143;
        Tue, 09 Jun 2026 07:53:32 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2c16649bc9dsm19642915ad.48.2026.06.09.07.53.31
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:53:32 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-beba94353acso544407966b.3
        for <brcm80211@lists.linux.dev>; Tue, 09 Jun 2026 07:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1781016810; x=1781621610; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:subject:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9nshAheis16fsfBtGYld+unMmzzCTRT676gO2+SBa4=;
        b=TxYC1h5jMWyI/p9t95UP4zLp04K/q9vp3TVsWszNGPwChvN1g+uN5XNl3b6czEuFSX
         yUYG0PY+aVtVysA+04sFizeMhTehxFw0W+NpNBp/7hE62inw0qFy6R94QGold2sWUbxh
         fZNfX8yfbbdAg0mRMqla/RP0DE7oQLmmCMWo0=
X-Received: by 2002:a17:906:cc55:b0:baa:1d9:66ff with SMTP id a640c23a62f3a-bf9373dad65mr124056966b.20.1781016810150;
        Tue, 09 Jun 2026 07:53:30 -0700 (PDT)
X-Received: by 2002:a17:906:cc55:b0:baa:1d9:66ff with SMTP id a640c23a62f3a-bf9373dad65mr124054566b.20.1781016809689;
        Tue, 09 Jun 2026 07:53:29 -0700 (PDT)
Received: from [192.168.178.59] (f215227.upc-f.chello.nl. [80.56.215.227])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0558f3885sm1052383666b.54.2026.06.09.07.53.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 07:53:29 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>, <linux-wireless@vger.kernel.org>
CC: <brcm80211@lists.linux.dev>, <brcm80211-dev-list.pdl@broadcom.com>, <linux-kernel@vger.kernel.org>
Date: Tue, 09 Jun 2026 16:53:29 +0200
Message-ID: <19eacdfce28.2873.9b12b7fc0a3841636cfb5e919b41b954@broadcom.com>
In-Reply-To: <20260608052854.11718-1-rosenp@gmail.com>
References: <20260608052854.11718-1-rosenp@gmail.com>
User-Agent: AquaMail/1.59.0 (build: 105900627)
Subject: Re: [PATCHv2 wireless-next] wifi: brcm80211: change current_bss to value
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Op 8 juni 2026 07:29:12 schreef Rosen Penev <rosenp@gmail.com>:

> Change to a single allocation and remove some boilerplate.

I thought current_bss used to be NULL when not associated, but seems my 
memory needs to catch up to today's reality....

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
> v2: change to value
> .../broadcom/brcm80211/brcmsmac/main.c        | 40 +++----------------
> .../broadcom/brcm80211/brcmsmac/main.h        |  2 +-
> 2 files changed, 7 insertions(+), 35 deletions(-)



