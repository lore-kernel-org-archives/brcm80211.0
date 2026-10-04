Received: from mail-pj1-f98.google.com (mail-pj1-f98.google.com [209.85.216.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE4E341BA61
	for <brcm80211@lists.linux.dev>; Sun,  4 Oct 2026 09:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107142; cv=none; b=o9I+tVPfa+mPMtIOJDwT5udb3EOPEgwS4BtGcbXI3e037S/xzTJj1xgAM2zVw2jK4K1wQo/11YjoOea9NNhH5EjhO9mCSrhq7Jp1dCek75D6jD8TPa2xyfPubuWY2xtXfvejkAkl7FzQ4oruE5dbO5d/Twa2kR7DbkvhlKPV32s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107142; c=relaxed/simple;
	bh=uSpJlr9pWB8cp8BrFmQO5ngregHs2jVsmD4SjTxJsbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K4WzauQrE1S6H/Yoq8jpgj5PTuojQA24xl1lnV1FxFR9ctngWubSr214uejcVDcJYSiRZr9e/fdqScbMimgNpZXcZlCEByGlMEDrRSFWDHpM/JUx7/jV/Vbtj4PS87IppxJoyG9egO2n9PYSxgB3OVNEEIR8377+H9HoyVfhC7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=H/x0bRsb; arc=none smtp.client-ip=209.85.216.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="H/x0bRsb"
Received: by mail-pj1-f98.google.com with SMTP id 98e67ed59e1d1-3a0a911e8d6so339563a91.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 02:45:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107137; x=1791711937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KxK826MAOAYwXMvz4tvmAzJFT8E/SsdJVdTSWQcGqO8=;
        b=hpQXNGr1nZaUoRfJUhisnqXs5/KPF+KSZvDLOarS2X7TJKdkGdaBIpR+blSa1btgGb
         Hv64MKfJ5H7dAaEQ7yjg+O9ZA643lVn7FRGAaNI99uwXtwymG6UGy8b5jkU3d2pGNaIo
         tE6V7LIIMs+hNdG2wABCpmeyvLkAyN46KLunDKI3v0/oF7CgDP6KtJIGYIACnhcmmdkm
         T18UWsoIdkXuthtcIcfeHXDz6cwrZkS2Fxr29+cCFy90+oFrxifJcCOHl41b78K3zkn6
         ygfnHnXmCkRaO+75xM9joHYEgGbuVAm5vxuHOpGECT4WD+ln/I1sD19hYKtRg8R0NQCP
         j+tw==
X-Forwarded-Encrypted: i=1; AKwUvBxvqcqWRrXTgB9o5xLrQcMHwv8RQDCgod0LcdE5A2gzq5wRsYRdNWkFLYhyFSZoYKcozVJO2rxGESQ=@lists.linux.dev
X-Gm-Message-State: AFq9FYLU80ra8pCZLrAqVUNvnn7teI0jSaf0mB7rF4M4pER+g5tjOIan
	4peFzEOmF8e9GwD9XsKvU2nAXHpTb4OnZZhvjLtK8aaKbwp2YWEoIrsFGBX8Rdomjwups2VGEST
	qqlYbSKx9F8h5fmUWmriIakVIXl63MaK6f0noerFbDpZVWTTBOZKRSybHKT2Br0I70ozR0z2Moy
	V7fR9QgcQgrjAh6ujpk85oW/V81dqmpjqK0o98n8tX9Zq6om/ZBK+V9q0KKZJpeAm813cHocHyc
	5C6DD4Pw3wRY7hYbJjanw==
X-Gm-Gg: AYBFou1jEqqBikqj0CNnl+lzOg4Zj4k5waiRCyAT9+GWsRyIixvWFA9DjCDzvwzCIj0
	TsoPe1YNv+pLbnOSElBPMmUkCiXC884N+spmR48SaiHN7j0PsUYAgYjAGC0ZgHvP4mjcLYzzCwM
	Yq20fZxUPcxuQp5BKkteA87zNwIUUlzvIOgxwg4TJN/OaY7Zz5x67OVQEPZGGfrHiib5R9QXSpC
	99YWVDwKf9OxASvWfbcTXdXU+F2RE9ubeznoZoDsWrKSZKoOoE1d0KtDtk8+hpH4A2pxfnkJXrx
	3bp6yMI193WSKO9aklj/sX6x3OGwG/GaJGzXvOzf3x7XQ1Aok8umVmQoVIbYFB47jCRYhdpOZIE
	lapXipPDmZMX3vDi49n+QJMwEekPqOEgBwnbb1dmx8WbnxSJF1yQNzolcBPS3WhGuSvGW1KRZYh
	oTA/QA8Dtvx0IQIJgN5BLbdYpTc4hGVx+WyqdfnGfPVA==
X-Received: by 2002:a17:90b:1d43:b0:3a0:c72e:46d2 with SMTP id 98e67ed59e1d1-3a786744cd3mr3026249a91.6.1791107136568;
        Sun, 04 Oct 2026 02:45:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a78e4269a4sm2432687a91.4.2026.10.04.02.45.34
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 02:45:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3510d0baf63so1796068eec.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 02:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791107134; x=1791711934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KxK826MAOAYwXMvz4tvmAzJFT8E/SsdJVdTSWQcGqO8=;
        b=H/x0bRsbboFxhAnW8OZxr8NYtel5p1jvrZ3qcR9e/hV9xck32HAiB98wIfYkg8M8IF
         O0PaMv5SJ80DEhuO9B4bl3YJbEr8MW8cyrsk5GpG4sNQHtV6/Zw34HVWuih7DuYG484r
         WGZ7V8nQUQKRB7nfEQIjxsF17S86Uy094hHKg=
X-Forwarded-Encrypted: i=1; AKwUvBzKuRLBMZB+ueSA4VparBQADv0KB1vh9HkZqdpYq/86F5WV2zFAIgt+sNBVVTQBmKsWujzUoP0uFP4=@lists.linux.dev
X-Received: by 2002:a05:7300:d509:b0:351:23ce:992d with SMTP id 5a478bee46e88-35123cea7f7mr2847630eec.27.1791107133685;
        Sun, 04 Oct 2026 02:45:33 -0700 (PDT)
X-Received: by 2002:a05:7300:d509:b0:351:23ce:992d with SMTP id 5a478bee46e88-35123cea7f7mr2847594eec.27.1791107133106;
        Sun, 04 Oct 2026 02:45:33 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272f27dcsm3508030eec.30.2026.10.04.02.45.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:45:32 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Janne Grunau <j@jannau.net>
Cc: Hante Meuleman <meuleman@broadcom.com>,
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
Subject: Re: [PATCH v2] wifi: brcmfmac: cfg80211: Report port_authorized for 4-way HS offload
Date: Sun,  4 Oct 2026 02:45:27 -0700
Message-ID: <20261004094527.1324037-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net>
References: <20260915-brcmfmac-4way-handshake-offload-authenticated-event-v2-1-fbb9cc7ac177@jannau.net>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 15 Sep 2026 21:17:38 +0200, Janne Grunau wrote:
> Since commit 416386060 ("Mark authorization completed on driver
> indication during 4-way HS offload") [0] wpa_supplicant expects
> NL80211_CMD_PORT_AUTHORIZED to complete the authentication when the
> driver supports 4-way handshake offload.

[...]

> Cc: stable@vger.kernel.org
> Fixes: b8a64f0e96c2 ("brcmfmac: support 4-way handshake offloading for WPA/WPA2-PSK")

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Janne Grunau <j@jannau.net>
> Reviewed-by: Neal Gompa <neal@gompa.dev>
> ---
>  .../wireless/broadcom/brcm80211/brcmfmac/cfg80211.c  | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
