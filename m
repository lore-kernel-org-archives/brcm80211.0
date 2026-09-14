Received: from mail-vs1-f99.google.com (mail-vs1-f99.google.com [209.85.217.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9C537BE6E
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 18:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789411368; cv=none; b=AHFYOfYnIiO1s693ZdKNWsKZ1yFvzvKyY5KBVlLswrpGR1y+BYHtB6XNLAOWnUgr0N7wPp8jYmgxeq19d3ZrXbbH4sgbI/JYy/SNTOV0owaVhQo+THaoMWRAzRMBqIdiwVod4CxLTOTzdBMReXmNvxp9BQhyux699qmqeRTlCSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789411368; c=relaxed/simple;
	bh=dVM7a9s1TxS2aIq6AXPkZaCie1+K/qRV6xxe5PnGBH8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fRgVbW03oywmPW5sBsMQ1ygjLe2g2YolSCLxiPXTNkYAcxKYZI3AOwAPBHEKhmKDCfljbtdSbNqWjaH5lUUeg+boYazFHht/fKocCVkx6JBy99SVCGgJoMRp2DukRzN+OENCxSrvqptLdBudUlH94yWLGkZf1Dh+XXJLLeswVuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=dfmjZt4q; arc=none smtp.client-ip=209.85.217.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="dfmjZt4q"
Received: by mail-vs1-f99.google.com with SMTP id ada2fe7eead31-782af6c753cso3952344137.3
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 11:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789411365; x=1790016165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iBKsdBmjCJJD8VrVX2tmAkv65OynoDpaqNBhjTL5Aq4=;
        b=Al1psIfFi+dALJKyO8GLxecrAHM2zCDFQG9Eg8jpqaDvqg3iZmRFVYrOrEAoGg8XVh
         7R5yyWSM1cJFEWOGqddj+WPKCXu/LpnG4TdOJ+4l8G+Ib8AfXarXz5m7tqeXVSqEVQy/
         8iKDOVZJKDeoO98andRqC4uFIbFA0tdhqY9IuGOEW331Ebw2eolvbZYkyTZVvepgNW+c
         +Kxoq4d6J9wPSv5nIfSQoA2kYT/tqJJ/OLFjDR/ADOrr5sJ4X1de8Z+Ubr1EKwid5WeV
         nKh+RG99D/v7Y3dedajExRj02wIEQ0uTQJndVuLAZFkKWGQ7j1C20XN7auNAr1o226Iz
         /Exw==
X-Forwarded-Encrypted: i=1; AKwUvBzI53knWC/RoxMDOv30DMwJ0vzM3Kftp9qqga/SQHKE6IJzV1sSHPWjWujRD4n5PFe9VNWiOG52aPU=@lists.linux.dev
X-Gm-Message-State: AFuF++mQFvwZqjt/Tmfng6O0bK+4Kh3fenlb2tLwbuGZi/uMWS9CHSaW
	XCSYl6QYX1P2KvmsocaGuX3WwHmMPYd/JymWo6fPeLs73l6QG5GDzHv82OkGh9UYpxIfURndTZL
	TmonjFXrO5/vBvXP4TnWe35BIG0d11Mrp7aY21sl+F16HBA0f44Tf6ni+da/bDYnqXoqNYiHjQT
	45lbqVedSnYNAOeFX3m7i24x2pcP57Pvq9TjGaZCqXtSSULiL6GVids27p9NKEKROhzqNhQt13B
	/iprM2blQIDQR7CWP2P4WVP
X-Gm-Gg: AYBFou3XGlG/YOEEx4qkgRAvJ4qwi2wpvhWvHuoDlarAN0TFUIyc0vnItbkshMPDNU9
	MNh5ZpCcSMX72aicQ1zhgr3jzIky0qmN0XWSKqUHj0n4DVCMPpJLuHyXzPWFPJSfYYLcEbKrBs9
	pm4O1KyNyU5UFJrEJ5wTGMKae67rtKR2d7C/usLCCIsZKqbRaeyY5LsuQ5iTnRvR86mGlrDleZk
	J6NYnBBWLs7HUk1GFT1GE66RStrNOOk/83Rh+m5+E8n/JMoi0Pjm5chey4xVlhOY61X87PspfYn
	VwpRKXtm+G7r2Z3LdHCN45iLFe0d83qEN5rJnGkYK0Y3YHq4/rnE5OJmy6PzYpEkumGQwmsiPW+
	PodoxNVSZnC/RZKJT4ZiqV0xxwdqiKC0PJglgWCLz357yNEo7SmxBVzKpHwrg1QL4qlsnTOx0V5
	pUTD3hExiu0hLw9vN+mz1UeMsUSImayudg8oiBdXg=
X-Received: by 2002:a05:6102:f81:b0:790:65e9:4f3e with SMTP id ada2fe7eead31-79b5838eca1mr5048848137.4.1789411364849;
        Mon, 14 Sep 2026 11:42:44 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-982b9cdf1a6sm3276849241.7.2026.09.14.11.42.44
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 11:42:44 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc42a07d04aso2982989a12.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 11:42:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789411363; x=1790016163; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iBKsdBmjCJJD8VrVX2tmAkv65OynoDpaqNBhjTL5Aq4=;
        b=dfmjZt4qERmg/i4vtUlibgC95xjfsElUuPWxpudyjTfsMyaco84OvbWxEBLKJqe+iD
         pxE0ZSMxHioSNktp6UPQVzm417hBRObDDNTRvVsLc4GV2WekuChhT9I8PkNHRrnNOwtj
         WGNKwuhGt6HZ7AHOjht/raButVZ3jKyLsx2PA=
X-Forwarded-Encrypted: i=1; AKwUvByav6FvH2PGfTsDcNHlPbHU4r6wTHYxQ+Jmqjp39ez+L6r0H4JwEbBSoKESeS1nwes/L6t1nj4IjOk=@lists.linux.dev
X-Received: by 2002:a17:90b:5785:b0:39d:f725:fb84 with SMTP id 98e67ed59e1d1-39df72615e4mr4353672a91.19.1789411363643;
        Mon, 14 Sep 2026 11:42:43 -0700 (PDT)
X-Received: by 2002:a17:90b:5785:b0:39d:f725:fb84 with SMTP id 98e67ed59e1d1-39df72615e4mr4353642a91.19.1789411363179;
        Mon, 14 Sep 2026 11:42:43 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1438d89556asm364156c88.13.2026.09.14.11.42.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 11:42:42 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org,
	Hante Meuleman <meuleman@broadcom.com>,
	Franky Lin <frankyl@broadcom.com>,
	Pieter-Paul Giesberts <pieterpg@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: fix lost 802.1x TX completion wakeup
Date: Mon, 14 Sep 2026 20:42:35 +0200
Message-ID: <20260914184235.1457622-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260811082702.44521-1-kmehltretter@gmail.com>
References: <20260811082702.44521-1-kmehltretter@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 11 Aug 2026 10:27:02 +0200, Karl Mehltretter wrote:
> brcmf_txfinalize() decrements pend_8021x_cnt before a lockless
> waitqueue_active() check. atomic_dec() does not order the decrement
> against the check.
>
> [...]
>
> Fixes: 21fff75d2fb6 ("brcmfmac: use wait_event_timeout for 8021x pending count")
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/core.c | 2 ++
>  1 file changed, 2 insertions(+)

Please add Cc: stable@vger.kernel.org - the Fixes tag references a 2012
commit so this affects all supported stable branches.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
