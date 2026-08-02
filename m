Received: from mail-pj1-f99.google.com (mail-pj1-f99.google.com [209.85.216.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD352931D9
	for <brcm80211@lists.linux.dev>; Sun,  2 Aug 2026 08:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785659953; cv=none; b=TiyWN0DIRzuWqv1sia5O1+G7JgjmZfng0DImrT8/a5IbOjcBVC0rkfL/5SQMIcxItjMfybXcxtm2gE8qMYay1LtINTfjVfiyCHF1xf+hKw47V/WArfo7RsxMag/I1XgkMx8DP83Aty8vcB79wVN+2k5ug9y87JE783vFO7n6njQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785659953; c=relaxed/simple;
	bh=UKrW9nXcUEOoZsQi1eBYDxrgEKEtHJTn83NEJj/UUrE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aK7v6H96W5MxuPb1byfV2ZevjPy5DsBQDRXhafrrLAj7l5rWJMWhyPYzn3MzedagAQJLFum5vh/Nq29VAK+ehVRdApfsZKdJyNN6iAjaz+rrJFF4MpnLnD6hTQLV9aR1KoqR0HNqR45JXgUygwyujrSY2QioFhFuen5I/82pJLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=IsAbDbiM; arc=none smtp.client-ip=209.85.216.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="IsAbDbiM"
Received: by mail-pj1-f99.google.com with SMTP id 98e67ed59e1d1-381b831d535so2709784a91.0
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785659952; x=1786264752;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QcNqyGzkZccinhf/pClfyqDVf/rDURIGbJC6+/X1yug=;
        b=GhZI0n0Nmm1E5ZmYX350DKQH05LsgaCATVvLL313adTniTEk8YUaaWqIENitmZW6if
         pycD0yjU5gegnNGbZpM/uoKdi0bH34K5aEcVgXotIdyEMlmJ9GVfx1y0G2d8cWmgvilB
         yl5hlgpsyoBIxypojKcItnACr1++OhyjVHJQbcUHzjTTPsYQEAtDXYmFXCPvzwpACX3d
         wfhiHnDPCEDVrYLnOrAlz7OLKKSjh+XTGdOUfq+L4zUYak7+iREj4cF3aQiJjzRaykmR
         dn8XX+kMjuFE2ZaAJjborJeKCzuDrCigrMBxYUE9eUNj6XCukZhbOdVbGL37w8igT/76
         JfZg==
X-Forwarded-Encrypted: i=1; AHgh+RpbCHVb+IPjPXwH1kIjr3Bnv6IKrKvs8sANimwJT2CSJRQRXWvKSn3MYldnjHWUwcTgYnzjSMd891g=@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7IFC+wKUModbhjz7GDWUzpey9haFd26f6/73WIcttJ6MuvneY
	D6Y3PKVS8p7cA0H06v9hSf7Kh76seu7oJuIeKMszoy+K/m8QHV6yqNtdurIcv+7ecZ3pn2UYgse
	qeY3YVD0siXzZvXKbbZQpg3g6pLk6E+yXRgXdcrH2CEn2fpsqlgxU9Sz8Sr2hiLCpwhPQXB7vOd
	avkulOgIUs7yW3tzZodbUuC5HRkSkblyEVIW6hf5H0puZJH+80hH0tkDvPo7yZeCrKSiW13V7b+
	Nm7ycL3rjC1d5AC5VqmeQ==
X-Gm-Gg: AR+sD10vIXQc4K7iejG8CYe5iL8fF6oLjVPtmplK/xFfcj3uwJT3mw4DMUuEo2LxgC7
	7mODQHLFoGWXG/qKkoNar4UlxqarvFHoAPsqdEGkoR4eCrshmXo0Z0IZD0JQWhbh2DxbiCMCS9q
	XzFKGfFF5ftAviIMZJRg06rTNGjzKie0E7XE1x4NLyjIKZEuqKYp7akp4cSHAHhTl2pmUSM0lbn
	K79DTiEWovnXub2Lr8X9hTRGrnUDik01TcjqnYXks4MPH5YrHCn5Z3HD8W8httayUmZzXtmCZdJ
	kDL58RImw4UdVTLTf3ozThpGUVlGQDe2ZcZn7t1qF5gf9RNmmKEwbtqkf1bgPInKqYJHyY6ZMNw
	otnkeozzqFMQJIxpe3bdu87/nGsKiZ0dBq2hYIzRcZqIhME6yq1d+dyWWVyfJuiujBXbnUzfNOZ
	Gy2kSs9+7tLeCn0SMeIIl588bi50r+6AmVP6D8olg=
X-Received: by 2002:a17:90b:584e:b0:38f:57d0:3a9 with SMTP id 98e67ed59e1d1-38fbc561c6emr5384022a91.36.1785659951666;
        Sun, 02 Aug 2026 01:39:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-3153e07e51dsm464489eec.17.2026.08.02.01.39.11
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:39:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8fc6b670b4bso23404936d6.1
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785659950; x=1786264750; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QcNqyGzkZccinhf/pClfyqDVf/rDURIGbJC6+/X1yug=;
        b=IsAbDbiMc3LTY4Ig3o+yeL6kii5oSnNjbyAsLSmGzuQODwQ2pDhE4NPAh788CTaPLQ
         XgQZClnDB2x02nA2ZAxUHEPkt9E/mx9tqdvvsmKEGmX4BGY+1jmZbia3kNbeJSeLFmIm
         3UuX7SUNIB3Zoe4TaQtQLZCX+D+RaDERWfHt0=
X-Forwarded-Encrypted: i=1; AHgh+Rp+EquIExbOnImAQoWdwe+dDoCsMuPECq6fbLxjiBC1Kw28rDQgcluJXYyV3/PxE5FFIolTOSvRToM=@lists.linux.dev
X-Received: by 2002:a05:6214:c8d:b0:907:e7e6:9544 with SMTP id 6a1803df08f44-908495bbd60mr101854696d6.9.1785659950058;
        Sun, 02 Aug 2026 01:39:10 -0700 (PDT)
X-Received: by 2002:a05:6214:c8d:b0:907:e7e6:9544 with SMTP id 6a1803df08f44-908495bbd60mr101854556d6.9.1785659949617;
        Sun, 02 Aug 2026 01:39:09 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435def8fsm49457956d6.38.2026.08.02.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:39:09 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Huang <Jason.Huang2@infineon.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH] wifi: brcmfmac: fix P2P action frame handling without device vif
Date: Sun,  2 Aug 2026 10:38:58 +0200
Message-ID: <20260802083905.3819981-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722082608.412472-1-Jason.Huang2@infineon.com>
References: <20260722082608.412472-1-Jason.Huang2@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 22 Jul 2026 16:26:08 +0800, Jason Huang <Jason.Huang2@infineon.com> wrote:
> Some P2P action frame paths assume the P2P device vif is always
> available. That is not true when userspace sends non-P2P public action
> frames through the primary interface, or when action-frame abort runs
> after the P2P device vif has not been created.
>
> Fall back to the primary vif when aborting an action frame without a P2P
> device vif, and guard P2P device saved IE access before using it for
> peer channel search.
>
> Fixes: 30fb1b272909 ("brcmfmac: use actframe_abort to cancel ongoing action frame")
> Fixes: 6eda4e2c5425 ("brcmfmac: Add tx p2p off-channel support.")
>
> Signed-off-by: Jason Huang <jason.huang2@infineon.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/p2p.c | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Provided Johannes is willing to fix the blank line once again. Fingers
crossed ;-)

Regards,
Arend
