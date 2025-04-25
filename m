Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B296823908B
	for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 08:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571334; cv=none; b=Y4Yi/sWitF34fwGhBtBPzJ0bpLKs7UrcZ6nqrfBOrRzXyFxqRrZHyLC2lUKuloQC8dcS+46A1iK7qv1MuPUDN7uu8bJiP/TrFfKUJ4v2DVAaSJ0bJmQkKGGGioPwefqZDKp7GHWYBXcw78o0bfZbIuqFcXEimBkTaMUlpgbV/KA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571334; c=relaxed/simple;
	bh=e0XX8DohJ6VA0/cNyZXvWggjah+MHvEtyETKVHlxyO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jkGj4po0DgR9SlJY+uSigxX8soW91hg4+qlmcEAXyzqu5HDD7aWnIrYSC0V5kKvzXZmBdr2m6xkKe2UWAIiKJ/VE0CKe4pfKgO5kV2XuSzASIf4Kd1myGLPqzpw9TObtT5EcCO1fc12D0OtGhJ1SPAZ92B9deTKlMxWh5qYN8J8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=J/Znsj3j; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="J/Znsj3j"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-22c336fcdaaso23854065ad.3
        for <brcm80211@lists.linux.dev>; Fri, 25 Apr 2025 01:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1745571332; x=1746176132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2UZxtW3kPc6nJSgpcHu4czu11dbH1HDpqjV9mIbR79E=;
        b=J/Znsj3jpkQJlhhMXJ0RN2cYxu7A5eZM9pgugnOby0uUIoGuz36s2cDrFB99rDM9Eu
         s8HTDJVLsihhvsODMvHC4lzi8S2RI7Mn6n8raqexwibSLbp2YZrQfDe4st1JmMoyTH9B
         BLJVBXOURycQau20DtX/CVRamPoWJiVG0hAfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571332; x=1746176132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2UZxtW3kPc6nJSgpcHu4czu11dbH1HDpqjV9mIbR79E=;
        b=oDwWRZRbZTI7saF5g0RG9pETBjRIVl39U/9fJ5+Sepd03sa3jXFP8Gvf61JbM7gdSZ
         AIkeu6ObGjdJ78ogsZAV3Z0GMBqMl2j+zeWac16LOpMx4+E630ogqveIHlSgNPaRylwt
         Bp/YKfgAjSchc1NgYwJ0xsGWv0y8uawr81QTnMh+B/c3qCojngwemjaeTSAr97Rm1fzZ
         9dY5JC/67XzboTxkhHI5OZhFrjGST5yHATB9xW4aLbYNW2H56kvCyIgcIvjzRVcIvgku
         ghwQdi7kUR6d6W4ERbWww+sKB2cQaDrkScUCh7+qaXwZ4DwvR9klIsVs4SHoy6WXga0F
         Y6Dg==
X-Forwarded-Encrypted: i=1; AJvYcCV/ae4lAdfi87eeyq5RdpU+SoVoa6hVxCKqmcpAQnnyw/QZEDjNCbM353kK+MQxRvG4YEBAixLYNMI=@lists.linux.dev
X-Gm-Message-State: AOJu0YwG/BdD6wtlpQfO1rzyuWuWRUx5zK0CPYvN4FskKM8S1VGpzeqJ
	FhEB+jD31SbZfxkIDWyShTmvTyh5UAKUZc3613SNPp/ArjKzxeFXu2nk0P31vA==
X-Gm-Gg: ASbGncuKhyNYgvkIuBpknaNCGuITmDYDens0V0hNnirbhsMtxPrQL4ExwuEi+FcJH2S
	vRCPHh9R9yudepRGdk/+Fq0q5QbrFURoXy3NV6wC2EClPuQi6mlEAursMBJz86hrqmSzM5V0Rlj
	KSsCGf6yFo4Jy3RRQB8zIUpK6XBcwKj2G0P4Cay9QCRQeYAdjSiKMUIFmysNUEAkd+0O+wZ8Ji0
	1xQaBYtlrjPDd/+DW1iJ9NQHC0UObKoqaVg3h+XVSz0PgHyWuL6E5kdbezoQvU67j+UTvZv476U
	WyeJmO7yUbXJoQN0RhI6zUv2MYFFFjEu50Af1XvzEcAqQ5Q/LOOAGacsMPJNWiaCQXhDaj1lwds
	j02iZsGE4+onZm3+JMG3Z
X-Google-Smtp-Source: AGHT+IFJWWA7uxV6gGnFl29pDwXs7U2A6lCoWVMelhPlCxhZLOYa1o1oceQsOv8ZEACJfUmg11faNw==
X-Received: by 2002:a17:902:f550:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22dbf62bba7mr20366085ad.37.1745571331862;
        Fri, 25 Apr 2025 01:55:31 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221943sm26988875ad.249.2025.04.25.01.55.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:55:31 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	James Prestwood <prestwoj@gmail.com>
Subject: [PATCH wireless-next v3 2/4] wifi: brcmfmac: make per-vendor event map const
Date: Fri, 25 Apr 2025 10:55:17 +0200
Message-ID: <20250425085519.492267-3-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.43.4
In-Reply-To: <20250425085519.492267-1-arend.vanspriel@broadcom.com>
References: <20250425085519.492267-1-arend.vanspriel@broadcom.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The event map is not intended to change so make it const.

Tested-by: James Prestwood <prestwoj@gmail.com>
Signed-off-by: Arend van Spriel <arend.vanspriel@broadcom.com>
---
 drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
index eed439b84010..38a9138f1fd3 100644
--- a/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
+++ b/drivers/net/wireless/broadcom/brcm80211/brcmfmac/fweh.h
@@ -337,7 +337,7 @@ struct brcmf_fweh_info {
 	struct list_head event_q;
 	uint event_mask_len;
 	u8 *event_mask;
-	struct brcmf_fweh_event_map *event_map;
+	const struct brcmf_fweh_event_map *event_map;
 	uint num_event_codes;
 	brcmf_fweh_handler_t evt_handler[] __counted_by(num_event_codes);
 };
-- 
2.43.5

