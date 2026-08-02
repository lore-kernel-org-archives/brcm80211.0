Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3B8390981
	for <brcm80211@lists.linux.dev>; Sun,  2 Aug 2026 08:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785659955; cv=none; b=ieJTYNYAIWUTK9BH2lX1AKgvD3S8N3FTvosnl63ZQ5dB2SrZofSgy3rMdXMuyMddzwmxePqeYDG/7KgOYGD8XfbExoPaxXZjDj5QKFceuJTxlYPFNq6KUrkwFVbOoL+HGiVmdRL/dHIhIl91iqgz/DZJuc3J6IZuTAw5zKak+sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785659955; c=relaxed/simple;
	bh=jdjGUbkBcV0dBBL5aNWg2VRyEgEe8YXwInGBRXnUr+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BVPtgqXvFbSh8W86Lnv0H5PvyRCu8bpO/1/icHkfGlYY+MvGCBLdUx+gsKw8VpQhqhnh1Ls5TN0IjnNrbOqAKbw6TmTm3IVuIRXRj2PAi6sJMMyLXkTxGtNPynD6Qul8RlIwCq6pVpZJ1ytM1eTls9m635PaUXeopeCtP+0sFNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=aGq6Zspn; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="aGq6Zspn"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2cf52d15d88so19402285ad.2
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785659953; x=1786264753;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PSsJZEdiBtDK2B70Vi/SVAEmECezuO0RlJM9j9BqAkc=;
        b=pIsDAEdxL85n4RU12Lwr+FgjOPRMhrHjJZEDtdAnyYqGrG3os7sRVWC64sm0o1EKXS
         7nu1jOASvkZzx9yHf6k4ddHbCPNs25WPI72Ovq3AmLEdoaagQHW9tUYdXek+gtH1PKfF
         PIrex3jlhmfX22lSd6Ag3AH+1isEiKkK7eQeLZC8Br+Z+m3lZnoXp201wDmCWERwfGEr
         CNK4HTPohPCCQ3ApiIqoM2H3wugrVmo82sUJmsum8H2lH4mSLpdryjUJ6SLHAoOtOhDk
         9GAabaLokcl+YsFrlZclNBPiWclnAWk8VQUzaZQSGapkF0gJrcTq2K1L3+PXmiQ7o7iJ
         suvg==
X-Forwarded-Encrypted: i=1; AHgh+RrUdKdu3Nuqgl/cpOnnZuqaYcUvx/r+cD1w+mw46wV2zOoS0cP5D+e9FGnvsHgVIxWtUrHt6xVJcYw=@lists.linux.dev
X-Gm-Message-State: AOJu0YxlYnYK87t+9oj+daHCRYxZ8RWs6rUj47SarthsxjYZtHZSnWvN
	KOt0l/JmSQqhH/60uq0iXXW91onr7IHzutcSJ2BEEe1jz3x6Z6hYwyHFn7/IKzcDuksQBj+qsg4
	Lemks6LaPXA+6fDb99TW92A6/T+dMyBG+vbpY88kHxKQxBTfepJF661SxpJNRxyTfoUKn7qTdIZ
	YabZfhdEswZCs6OaONIlOk/YRKmzl92UTm1CqZBvW6GmHb8b8OVfDQAGgHeuDYfgePTCZYX9o+9
	OCRnrnTttvVs6R3OOfBqg==
X-Gm-Gg: AR+sD12IR8aitIWtSynRIfWfurdPO0qWKpR2ZwI3AjB/9DOXdcmGecfGa0X56M5lTMI
	aemXOigpxg1W0+NnPF7woMP9iqVy5RENiIANZ6IsFHaUQRjKE/n8Gm4MOuvNm4d90+OY0plhAc8
	WcrZbCxw89ypr3d6qERkja7ELTsB95Ip1nIqf4xXqc41fFjMiWdIMc+B5PaUVWOiuiiZ62y97zN
	oX04Ekz5IltxVdw4bcwv1b7fiCr/Fp3/zoJ6iEraye7N37fgITyIWumJrHpeXWh/THevaxttyyN
	iNbIJRFg++s57gQ0GZXNXJSdcK/uhNW6fsJl6j3oEdpLdBC16QzsQ6IzSfUEAMH0crPbTsZnaKm
	Wut67zrrxAzb/f8aJjR0gUUIQJUyYajVWBAERupyiuKpYjKGt39KFARuZkopv6SJz8/w8fyEcBL
	6l7lXfgohSeJmJw59EWy3uzPrO0+5FfeHcPr0Fgdk=
X-Received: by 2002:a17:903:3843:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2d052189686mr57708925ad.3.1785659953336;
        Sun, 02 Aug 2026 01:39:13 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-27.dlp.protect.broadcom.com. [144.49.247.27])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2d04ae3f6a5sm6288145ad.2.2026.08.02.01.39.12
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 02 Aug 2026 01:39:13 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c083f1818so23101781cf.0
        for <brcm80211@lists.linux.dev>; Sun, 02 Aug 2026 01:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1785659952; x=1786264752; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PSsJZEdiBtDK2B70Vi/SVAEmECezuO0RlJM9j9BqAkc=;
        b=aGq6ZspnUAuK9k4wjw/90PGvYm47vvaOg642MgcEm8/Erkuuiz7RVhZC5Ej0BLqVHD
         Na8vrqb07WRYZQzq+H0gRYfTYylMwE+7t6z1KCxcrwas5gpXSidSRJjNtgWgybzezWQ5
         MLeetzkBPy/t4QX78D5/XayFg95LVA357TxcE=
X-Forwarded-Encrypted: i=1; AHgh+RpniQOyGj/YNQuhqPTz+E7WqYQAZvx+0GTQFXx0cTDSgoQdlWU1jU90+9A36qyqsEQ0WR2qoLRlFuA=@lists.linux.dev
X-Received: by 2002:a05:622a:141:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-52b567da7acmr119734381cf.39.1785659951988;
        Sun, 02 Aug 2026 01:39:11 -0700 (PDT)
X-Received: by 2002:a05:622a:141:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-52b567da7acmr119734161cf.39.1785659951525;
        Sun, 02 Aug 2026 01:39:11 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-908435def8fsm49457956d6.38.2026.08.02.01.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 01:39:10 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Abdun Nihaal <nihaal@cse.iitm.ac.in>
Cc: arend.vanspriel@broadcom.com,
	linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] wifi: brcmfmac: Fix memory leak in brcmf_sdio_read_control()
Date: Sun,  2 Aug 2026 10:38:59 +0200
Message-ID: <20260802083905.3819981-2-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260722110713.115988-1-nihaal@cse.iitm.ac.in>
References: <20260722110713.115988-1-nihaal@cse.iitm.ac.in>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Wed, 22 Jul 2026 16:37:12 +0530, Abdun Nihaal <nihaal@cse.iitm.ac.in> wrote:
> The memory allocated for buf is not freed in some of the error paths in
> brcmf_sdio_read_control(). Fix that by adding vfree() calls.
>
> Fixes: dd43a01c5cdb ("brcmfmac: use dynamically allocated control frame buffer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Abdun Nihaal <nihaal@cse.iitm.ac.in>
> ---
> Compile tested only. Issue found using static analysis.
>
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/sdio.c | 3 +++
>  1 file changed, 3 insertions(+)

To be applied to wireless tree.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
