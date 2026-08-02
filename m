Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491A390CAA
	for <brcm80211@lists.linux.dev>; Sun,  2 Aug 2026 08:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785659971; cv=none; b=TgdFRmn/NX7uqHxl5dWfR80hZ3V0aP7kduzpqqBT4GZoGEPyEJ35/OsdV6mUIOEF0erZFOixHdX+lAt+XpIjPb0aJWKFSLa9xHsP8+DQVh0GTcRjm3FeOGd7EsxhbfGmhE5eA+tePHkR7nN4ZRlUNUZAa5CovU1ZQkh5axsB+5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785659971; c=relaxed/simple;
	bh=W3h7P7UQ6JCc4szLwupXzyRq863Ul8K0GSnjj2bwl+I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ffg964avzMntrDsu5e5RMmmMITkx0nKFhrHVDvHDHpg6/rXYzdIr46BDgTUsWSZn+fE6rSp3kD/kB1q0C/BwnXHdHM/xt/W40zu2E83DodBqiWi1SiBY6BzzKbnmzeONcklVQriSTm5trwHbYuakwH9Wrr+Vap1GOnHLy63/5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=JJPyRyx6; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="JJPyRyx6"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso24821615ad.1
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785659965; x=1786264765;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PNoZ92uFtSux85DfpCBQ1jLiUM/x2tYkPs+r4OTGkvM=;
        b=mNq4xmD0lt8E4aHA9nv/J8jJQavi3LX3YmqI0HQwnlxPl7HVuFOpV6j2rhkoxv4vcm
         UaxkR5SsAZrXJvNLscg9eoU19zWSS97up3VsLgpbS3dOR8zozY0Pem2JA6bRl46Eb3KX
         rVuPJYFfYs54l7Y6aA/pT/L/iHGP5V9abZDX0ydds+/9ySM5R7TuF8d6zg/5RJW9cg4P
         /zkigaEw68Vqw4q1DPHvNMkDUe7BA8ZhxNXKAHDOmdwIja9Bzh9yAS6QDCAhnqao0Wxh
         f154GRi+z2qsQ3Gwo6KmfPrv2cyW/mlMjEOYlNOLcupHT93t5C56BZwMDAUVeQ6jLVX/
         o0yw==
X-Forwarded-Encrypted: i=1; AHgh+Rr2EZXvcuUVJ4BBp3W2oYbaWbih4l1DS49qhiIaOdHMVpn8xE0DWRp7bkJy9M3VbfJ2QKQ1fvFGp2s=@lists.linux.dev
X-Gm-Message-State: AOJu0YzeGcypMr4pPePEG6M1tUMnQpEmJwRh02ge1wMqEYnic/WgjP7j
	zwd+59fQ56B2A+k2bumPKuJz/N0u6H1YDLzLW2a6dANqYz6MtiFlOoJkbZ0mzVC3lRDClN6M1IY
	22I38sEwXPTg109a3VN9qGfDBNdZmMnaRVb7gtnqT6rd/wenFyRJvHl8XARTrbez20jyTuONMuE
	Tjw+sBSfYS6X0Kub4d0cSqyAWRm4XRlq7EUGloXCGGz/64xsQp/ONGGDdX3E4MixGuGWx+xWmFr
	d8vxCp1N86EhjK/6udRHQ==
X-Gm-Gg: AR+sD10OkANvSH56O7NV7xhVr9MjEXdugYOK+QcsyMXOGewxt+x9j6v1Zjl7bym3OJ7
	fcRzNS6q9Si9coLFwYCAZFINKF7NDHlpa1kPMps/WD9RcmzFYNIuyELvII/3RlBVaSXSpZQ5Gh+
	jDDRJ/Ofw6rROOPehdauKWOZq5pHeYnJvQIjqxXm1jbzMl+s/6KvhJGHHXCr1P+j4Z5bXgW62sZ
	fF7JWKhHwI1YqTgpS6LhFJM5PoDIUFyzCOBQzf6QbABjGaxv8FmNfmLAAAeb5VMghuI8XZhI6t8
	4ZUOyk88YZ1M52btY5VNgMxocdX5kPYhV4t4axmtXwewBdg+ds0pisVixvx6gFR3jpvyMHnICCa
	bqmF1xpxQoZ6vVU8fvbaM1azr9uSHyaeNLEScZHUv/LsplO6aUVkEx7X6mgFeOg9GG9GuEnaiyz
	yY2DXTU4UehlgwnDwL3pK97IdrnjtCybDmdUuoZK8=
X-Received: by 2002:a17:902:e785:b0:2ca:6eca:492f with SMTP id d9443c01a7336-2d05223e878mr59170645ad.14.1785659965508;
        Sun, 02 Aug 2026 01:39:25 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2d04ae3f5d5sm6453325ad.11.2026.08.02.01.39.25
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:39:25 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8e934385db1so24157566d6.0
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785659964; x=1786264764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PNoZ92uFtSux85DfpCBQ1jLiUM/x2tYkPs+r4OTGkvM=;
        b=JJPyRyx61ITOcjAf2Z6ZU0bk9N8Gq/jAZsbS/9gjUxTN5fjYHvgAn9KmUvqLSpuT5f
         Yle44xZaTQdPcxGmM70cma98Kk0LN9JN9+kAg62IMiO9XQq33sGDOJZ4BkhOQOT0yd2K
         WXJ1iovmKDa6DGJ281G/wDxLrXIPAjhzGVqmI=
X-Forwarded-Encrypted: i=1; AHgh+RoGEiO5cfrY4VWc7tqtvzsDfBKHK0dQonk61Hp85KYACqEqT75NBwv+ojAkKT/gblz87sB7fn20HIk=@lists.linux.dev
X-Received: by 2002:a05:6214:5015:b0:8e7:8d53:2417 with SMTP id 6a1803df08f44-908496389f6mr108159896d6.27.1785659964073;
        Sun, 02 Aug 2026 01:39:24 -0700 (PDT)
X-Received: by 2002:a05:6214:5015:b0:8e7:8d53:2417 with SMTP id 6a1803df08f44-908496389f6mr108159676d6.27.1785659963646;
        Sun, 02 Aug 2026 01:39:23 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435def8fsm49457956d6.38.2026.08.02.01.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:39:23 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Bogdan Nicolae <bogdan.nicolae@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: configure SAE PWE method for external SAE AP
Date: Sun,  2 Aug 2026 10:39:05 +0200
Message-ID: <20260802083905.3819981-8-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729053408.13715-1-bogdan.nicolae@gmail.com>
References: <20260729053408.13715-1-bogdan.nicolae@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 29 Jul 2026 00:34:08 -0500, Bogdan Nicolae wrote:
> When bringing up a WPA3-SAE SoftAP with external (user space) SAE, the
> driver never told the firmware which SAE Password Element (PWE) method to
> accept. The firmware was observed to corrupt its heap over time due to
> this omission, leading to firmware trap (data abort in heap allocator).
>
> Parse the beacon IEs on start_ap() and set the extsae_pwe iovar
> accordingly: 2 when the RSNX IE advertises H2E, 1 when an H2E-only
> membership selector is present, 0 otherwise. This matches the behaviour
> of the upstream/vendor driver and only applies to SAE-capable APs when
> external SAE is supported.
>
> Signed-off-by: Bogdan Nicolae <bogdan.nicolae@gmail.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/cfg80211.c    | 75 +++++++++++++++++++
>  1 file changed, 75 insertions(+)

As discussed the extsae_pwe iovar is vendor specific so the fix needs to
be gated on the CYW vendor. The cleanest approach would be to add a fwvid
hook (following the pattern of set_sae_password in brcmfmac/cyw/) so
brcmf_parse_configure_sae_pwe() is only invoked for CYW chipsets.

[...]

> +#define BSS_MEMBERSHIP_SELECTOR_SAE_H2E_ONLY 123

This is already defined as BSS_MEMBERSHIP_SELECTOR_SAE_H2E in
<linux/ieee80211.h>. Please reuse the existing constant.

[...]

Regards,
Arend
