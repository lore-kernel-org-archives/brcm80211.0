Received: from mail-pj1-f97.google.com (mail-pj1-f97.google.com [209.85.216.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C17411A08
	for <brcm80211@lists.linux.dev>; Sun,  4 Oct 2026 09:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791107159; cv=none; b=qwHICT8kuPsZbOAj4KRrPuD33k9VgsWmorVjJ3pZqxP5/YYKGOkcJkRHVtBDdR0Dj5BmopFxu71mDRTRBu+TDCDJGLKObZVqXlbAG1909MksFi7cKYgj4M2OX6mVCMZp1Kn/ZWvMPTnVOEIFv0zUtEyr4fwet3yYVBM9TkxNqhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791107159; c=relaxed/simple;
	bh=u+vYm56YwNMck27Per+ZsEAji+EkicSsZhqAv5T9Xcg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhQEpFWRLOEd6Ela61/dT1uM3T2pumGGnkmVf+XXwQAcmd7Si5GZSzWbEy3uyKnhGRMhVbnRQ+MfAox0L4ewO/cAcUvUzHuNLAfbyZFLkQhrc4gSYciKuubMUNDez/wRjy+sNGgsHURQld+L/GbQXQRP5S6u32SqNsLz8G+MO8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=c7UZcsEA; arc=none smtp.client-ip=209.85.216.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="c7UZcsEA"
Received: by mail-pj1-f97.google.com with SMTP id 98e67ed59e1d1-3964dfb5b9aso242929a91.1
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 02:45:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791107153; x=1791711953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PyyofAU4SJtVBmzx571gZStp+YRjOTEqsRVPq36CL2U=;
        b=WYKRLCB2cxMsoNkYMyDd4E8Indw9oj7BlRNZ/osQf+biEChqE80nn6we1Nj+Hdgjnl
         CuHJv64x6AfCmPUCPF5EOBRt+h9YC2TP2QDKy4ZSceHHE+yixcyqGxf4Z5UGGp/agE2v
         qudeFk4KLLzg5bnwFxV3zqTlCNxS4HocIaDs90wqznl1MDkzSlwg0v2xl0yLZcJxjqoj
         vklAIlcIXwU5NI3LUJmswlrk/EkI2rFmoO/UMLftEtc1NGZy9HpR05OT2IgkpGKZGltR
         1uS4teu+AzZRYXOJhXdxB/4xXFAbUXmIl/VNshPgYZFbnytlLYFVgn/VvWkjusJzYEYP
         skFw==
X-Forwarded-Encrypted: i=1; AKwUvBxKFC8Fs/7Xuk+4CldtYBYcxDbgg3Tpxe6tYm3POoNLYdTHq8zKWDETD2zaHp7P1cK+1VkJ14lzQgg=@lists.linux.dev
X-Gm-Message-State: AFq9FYKOB+S4788smbfMkcaDHz++K1cHfiZEKKBbkK2Cxvm/duQhYbDl
	0C9Is2JMkf2k2ZLU/xCRr5uzrqUS34ginUXsZkaIYp+Dp6yc3chIePft0GStGDdw74gh8PlPy/J
	qpXgUkGOYPYJZdnYKorbFPCiGxVVDcl3gtM/cF2k3n0XFenMWSUayga1oOUXL05d2Z1tYbTDGM2
	/tg9y1oQFtQK4mAyV39CfvZ7vxRplBGOd7uYWcSE1VkXhDTb8uuk4H+CQK2eH+s114ODDMfdGRE
	NEsjvieWTtZehkwreyq3g==
X-Gm-Gg: AYBFou1+mGrI559po3NiP4pFXhi3UzvIvI/jFIs0TErchW13QzULIOaOvdN/WgQXYtM
	74/5hDinoL/BczV+Qo51rVx869DDWfC7yPrSFqpXRdsDxDCWpafbAqXKLI3qXv/LPmrLi1Ni9/2
	1v2dADxChRlPmofvpBE9uEA4OlvabHklwrmqFqGOoYmkiNx1fTFA5x/gqJTaaEh0S1QcNqzmuBx
	0QzxSxxD5N/6d5LwWpPzCYd4hTLN7Se2Y5m/O3CPZ7yg1DfeC7sV5c+sSLqZlMqid9BpndydtbR
	C8wXS++Iakuw6jWBJf+Z8LDiJwkw4EKj2ywiQMlP0pJsb49NCXj+sWB2jmUrFvFMCYmK0gtcwNG
	9q23/1+NDh5gZFoto6FhEnZJrJR0Wz6gw7Ah0ARLDoOdrwI20DYO/ExcjKHlEwMOiudinZW8eVJ
	YvNo6ptZdY427P3OEz+tTzxJTBJ5aVUn9CKCwSrAjeBQ==
X-Received: by 2002:a17:90b:4a91:b0:3a7:3474:b1ee with SMTP id 98e67ed59e1d1-3a73474cda9mr4200096a91.60.1791107152914;
        Sun, 04 Oct 2026 02:45:52 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-125.dlp.protect.broadcom.com. [144.49.247.125])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a78d4dd2c0sm2479973a91.1.2026.10.04.02.45.52
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2026 02:45:52 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-34d49d8dee1so1264881eec.0
        for <brcm80211@lists.linux.dev>; Sun, 04 Oct 2026 02:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1791107151; x=1791711951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PyyofAU4SJtVBmzx571gZStp+YRjOTEqsRVPq36CL2U=;
        b=c7UZcsEAU8zTS6LMP2JQnfu/dAn7i7F/jn/9qB8oYHWFPVHErSORl2cvrKrScOxD5e
         prBe2MiztlNxE36sopLZDd8QHGyhMLGJ5AxTm7KuvjkpwFSJBg2od5YdG2srhT5dqaQ1
         p9iE/Bml8F1iuOZ4kcXTSdjjEdz0P15XwgpCM=
X-Forwarded-Encrypted: i=1; AKwUvBy7qH6PT52Mo/QOU3P1NTQpW2gwKDOgS5g/zrRu4ulCkcteRcK2jVIws7QHwWIfXCjMAFZsBuHyoNs=@lists.linux.dev
X-Received: by 2002:a05:7300:80c4:b0:328:3542:b73e with SMTP id 5a478bee46e88-34f150c28eamr12941728eec.15.1791107150915;
        Sun, 04 Oct 2026 02:45:50 -0700 (PDT)
X-Received: by 2002:a05:7300:80c4:b0:328:3542:b73e with SMTP id 5a478bee46e88-34f150c28eamr12941692eec.15.1791107150271;
        Sun, 04 Oct 2026 02:45:50 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-351272d5103sm3595747eec.27.2026.10.04.02.45.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 02:45:49 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Pengpeng Hou <hppiscas@163.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v2] wifi: brcmfmac: bound NVRAM comment parsing
Date: Sun,  4 Oct 2026 02:45:45 -0700
Message-ID: <20261004094545.1324258-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260920034414.16948-1-hppiscas@163.com>
References: <20260920034414.16948-1-hppiscas@163.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Sun, 20 Sep 2026 11:44:14 +0800, Pengpeng Hou wrote:
> The NVRAM comment handler searches for a newline with strchr() even
> though its input is a firmware buffer with an explicit length. A comment
> at the end of an unterminated buffer can make the search read past that
> input.
> 
> Keep the input extent in the parser and use bounded searches for newline
> and NUL. Preserve the full input length: the capped size used to
> allocate the output is not a bound on the input, which may contain more
> than 64KiB of comments. Leave the outer parsing limit unchanged.
> 
> The issue was found by our static-analysis tool.
> 
> Fixes: 3e99b08ab53c ("brcmfmac: enhance nvram processing")
> Cc: stable@vger.kernel.org
> Assisted-by: gpt 5

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

> Signed-off-by: Pengpeng Hou <hppiscas@163.com>
> ---
>  .../broadcom/brcm80211/brcmfmac/firmware.c         |   13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
