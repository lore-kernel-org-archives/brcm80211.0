Received: from mail-qt1-f227.google.com (mail-qt1-f227.google.com [209.85.160.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D4D3002D1
	for <brcm80211@lists.linux.dev>; Sun,  2 Aug 2026 10:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785665740; cv=none; b=r1RUz3nHkjwBqjUP8SGe76FrSNvAoRCoUbIjaYvShxmktbtS+RCXSAuCvXyuZbhrc9IZrWFWR1Ol2Lrx6VRCRrjULhbrBGLrl25JBMaAsfHNl6TpqDzmDDH5Bfzp9LUE1xAIinmAVt10foenXOK4p1Z9t/5UMuQBqVcFKTDBZCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785665740; c=relaxed/simple;
	bh=MSSkEb803dp1gP2HBNhK12c9CPsMaiZ6pLgHJaHNeqY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LoXPlgmI2Cglmvz4F/a7puCOSGtDe+VQzY9YNSSEeDH0hNFJRpy/qSN7T09qhmOHg+eg5HAPotdsFYvDCy3K7fAxyRKMdJYa/ZgCIWc9hWJwoNnO2dsevb5qzNDIfbFj5pYsH1CrhNndjQS+Fi1MmY9FDLOQNoQrOqFjDYocT0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Lfl/zyHo; arc=none smtp.client-ip=209.85.160.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Lfl/zyHo"
Received: by mail-qt1-f227.google.com with SMTP id d75a77b69052e-51c0cea8883so17157521cf.1
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 03:15:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785665738; x=1786270538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1lDhnz0ePlnIggUFM9dMYWIu/4DcgouywlgpSKZ0Fo0=;
        b=Fb5UsUqjtmNgdoHyFnU/BBPgYlTUwnJdiv5evtb7Lebz0rM8M1CHydB79DEGdqZIFh
         i09t6mrpF20ici+08DwIFX9mAU47iEnQiW8SrI9GLx/XIROV1DPXFDe3Wk0OsNgc3UC0
         4YGCytX1XrjvUy/PMUn5gP0lcChiShI+3q8uczl6NCMCXHnq0NzY5j3LD+ktmHuHHOhI
         z3ZIq3Wq2d4BW4ZnuHcJR2iicp5t7rHGDdJaGWfbhxt81+Du83WhKM2IXnORadPDsGhQ
         rFTU1cT6R9gznPdHxwc+s0wRqgNE3547m4ETK+rwWqjfwq7zgW1Ha5nj4hXRPhxQ+5kF
         OwlA==
X-Forwarded-Encrypted: i=1; AHgh+RqZufmypzsSHIBLxVXErSpVPzYJTmDgrW3HPdHinM0j6OOmv/C/iuL+cKjJrmOQUqMGTPE0wkufOYA=@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq1+f1k+BJr3pGSy6mTAeb80F1scUWD74f6d7q8OxOiCxpVaF/
	ZwAne2P9tPAISvLKaXc/RMkog8zha9MQ4RSYj94ZT+aaxZdg2RP2Fd259JU0ink+GKC7cXv9DwC
	GQBxBwdDnQieRmDxPlrTY0qy9jF/EG5XmaFji7DAlDHmNEe8J2ajg/8oYECQmr/dZxO6pLqQR2U
	ws6J7PFpfop4rs93EsH8voES0U6EJfsHtTajTK/8w8PoechhwrL7rHBaro2gYn4l5RGe6dbdmZZ
	NGaOFWVv8In6fgfmUAJMw==
X-Gm-Gg: AR+sD10Vm20rRcCmfW4xh3s0LHWpkHAtIMAunhvXRwtcQlMcWLSm1rX2nEIjH1980dz
	plUar9kd/ZKmP8AzeVYOKwDcSMCu2sf7B/XI3C78HSDehbYSXCtW7QuR2JlWLV2a352yvCNLtyc
	rUg1zg0Pn9XcuoByEeNR8MX6XRDSiIUH9y2YcabsJ/eTMvT+Lo7G0wq/up/7idv04Q5vDf0MiFp
	Djp4fS/N30m50pDgw0R36XBG44jyLtGogiHM8vpxlW4oDo5+JDFhhQcLTimgYBNFKrODyynEoHf
	nD56bjejS3B5WVkyyTIYY/PYyd7qxF6GyNt3d87Pvbto7irIIRXsqsVRFf+/6oQNEsjJY9X9y2M
	Syxx8Ly0ZGn0QmFHI1iGXs/arSUPpb5eVLs72WEY1niQGOAhvzp28d7Cp33CzSUj8YpGyZU+mq6
	7y+AJbebBeuHBOPfchvE9KwkJYWiI9SqBuDyf7UKQ=
X-Received: by 2002:a05:622a:4186:b0:51b:e946:45cd with SMTP id d75a77b69052e-52b581888f5mr110044041cf.14.1785665737950;
        Sun, 02 Aug 2026 03:15:37 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id d75a77b69052e-52b4eb93d28sm2624371cf.23.2026.08.02.03.15.36
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 03:15:37 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c9c26587e67so2154668a12.0
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 03:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785665736; x=1786270536; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1lDhnz0ePlnIggUFM9dMYWIu/4DcgouywlgpSKZ0Fo0=;
        b=Lfl/zyHo5DYbKJRfUFTlIOQl4pQSIW1z5lrTCj2/B4F5XP/Enr4M6JN5KSTokC6GXP
         NddMDPl3ofaixFCCQS39ZKVyOS33qtPwc+swoRxN8E6Hr9K2ouxzYx+ugtvlSD+vVaur
         Cp8nrbU6BT+Ic2vhxwnxiPNDi4CNSb1eQGt3c=
X-Forwarded-Encrypted: i=1; AHgh+RpD0sCk20rrnsNmwpG2wQ7wcOBsFLQ/de3p95N4r4XDiDp9Z/t6DIMXZWMjv7bMTAXvBpq3ymxSSDY=@lists.linux.dev
X-Received: by 2002:a05:6a21:e598:b0:3c6:6f25:594 with SMTP id adf61e73a8af0-3c91aa0a4f5mr8073843637.38.1785665735753;
        Sun, 02 Aug 2026 03:15:35 -0700 (PDT)
X-Received: by 2002:a05:6a21:e598:b0:3c6:6f25:594 with SMTP id adf61e73a8af0-3c91aa0a4f5mr8073833637.38.1785665735336;
        Sun, 02 Aug 2026 03:15:35 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153dd9be04sm24193719eec.9.2026.08.02.03.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 03:15:34 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Shivesh <chanelshivesh@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/8] wifi: brcm80211: performance and stability fixes
Date: Sun,  2 Aug 2026 12:15:30 +0200
Message-ID: <20260802101530.4028803-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731160646.3812-1-chanelshivesh@gmail.com>
References: <20260731160646.3812-1-chanelshivesh@gmail.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 31 Jul 2026 16:06:17 +0000, Shivesh <chanelshivesh@gmail.com> wrote:
> This series fixes several performance bottlenecks and correctness
> issues in both brcmfmac (PCIe/SDIO) and brcmsmac drivers.

Two blockers need to be fixed before any of this can be applied:

- 2/8: num++ was dropped from the subframe-parse loop. cnt is always 0
  on return, so rd->seq_num += cnt - 1 underflows to 255 (u8) on every
  successful glom receive, corrupting sequence-number tracking for all
  subsequent packets.

- 4/8: pmksa->fils_cache_id does not exist in struct cfg80211_pmksa;
  the correct field name is cache_id so this does not compile.

Beyond the blockers, please split the series into separate submissions:
1. Stability and correctness fixes (3/8, 5/8 TX-stall fix, 6/8 Fixes
   tagged part)
2. Performance improvements (1/8, 2/8, 5/8, 6/8 performance parts)
3. New functionality and comment-only patches (4/8 PMKID_V2,7/8, 8/8)

This makes it easier dealing with fixes that should go to stable trees.
For the stability series you can add Cc: stable@vger.kernel.org and a
Fixes: tag in the commit message.

Regarding patch 1/8: the patch also fixes a race where a ring state
changes RING_OPEN->RING_CLOSING while blocked causes a permanent
netif queue stop. The fix relies on the atomic counter so keeping them
together is fine, but this change is primarily a potential bug fix so
rephrase the subject, e.g. "fix blocked-ring race permanently stopping queue"

Finally, some of the commit messages seem to use LLM lingo so if there
was a coding assistent used please add an Assisted-by tag as required by
Documentation/process/coding-assistants.rst.

Regards,
Arend
