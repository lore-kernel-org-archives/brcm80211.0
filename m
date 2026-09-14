Received: from mail-pf1-f226.google.com (mail-pf1-f226.google.com [209.85.210.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC25C389107
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 20:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416302; cv=none; b=DeG9eLADUiWh4GG6cCKFvskioqFgKM/mmdU08Sy4GdwqXfR5Rfmb3oH9lvF5znmKXEsxDI0hhFIHDpOmiualY69Lxs4GCroiqwtHVcFaHXeQC9TfQDrYzHyRrq5lT9uhsr7bdk2XInXqu85z7SMbPiGWOYjVYTOXyAWBieqSS/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416302; c=relaxed/simple;
	bh=fWtIB34HF1Bz4HCg8diowbdp1Z3+dGIea1Q32YVlzI0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dnqKIB0K2l42QxSGUeLaKKd/IUcK32VNk+wGxuRg+gMzSn8XlocbFjuaG3jbjsTm1iTF+EB5NEcv7kXxvlYPExC/bFdd0LR7rzQ/TFwUisPaWOfozxUfkJQWeDa7mIpYJtkSHlVHFui8E2wbaWuNOsDzNySGtMlIVzsDvo0/jD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=OBwzXnVM; arc=none smtp.client-ip=209.85.210.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="OBwzXnVM"
Received: by mail-pf1-f226.google.com with SMTP id d2e1a72fcca58-8690079f2c1so2028948b3a.2
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416301; x=1790021101;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gPHjF43uGTlI2Z7oUAXU9OxdN/wtUZfqVEKhDlGmvvM=;
        b=mo0H3v10OCOD6eGvO80zlu6Mv7lsohSGqrB96WkVF1cdwE83xVaw3aawhCMz2JQHVZ
         fBbr9b58EmIpxUy+IfJ0uRmzBDJGRB6d8bjdeUGWm957nqSR/R2rekPFOSgkyBxcgs4o
         juacFa9pNLxeYEIYRqIB2A6YIl4koZR1YWyIJyHop8AXRzzz9hxUluoCzj+Ji6moDvOz
         oMgBfByZeJpKrwwHPfXCRqwC2DIemMDOo1qVHkdQurKawYx7K6eqbHmCpfW5mi0WPOsG
         WXq8VrmQQP5QjwaIJ/zcY+NxcggUDmyja1EWHWeOgDDscY1urzAWe32BfoEu0T5QdXJU
         fe7A==
X-Forwarded-Encrypted: i=1; AKwUvBwseUaf6d0NMnW9eyfqwUNk8AShnDl/b7ysGDOQc3nU7MPoyv4ChbvMMH6swLWOQKXYqHQpGJw9pXg=@lists.linux.dev
X-Gm-Message-State: AFuF++ksqWLoE21LqljfxuBIM6GJCyMNSaAYzKgFBkDIXVCM585CMnEq
	FCkKulJcXled4Mx9zevOcdET6YTJp+60TPmaMLPYB1j11heYf3uCfr/ntklHCwkaoBaUAkOpVS4
	e98s1WZ3CNEAuAPWnFeW+boO4AZkabDJxNGgtG2Wv2Q56AhXl+Nr4N35bqR/g5QKEJAg2XYMJ+W
	5WUDIW097rpPNXB+2GSM2ZsgFQUcZa9k0Rg9cwQwaPWr6Fw/RV61OYC7EBQy4lFLUTbzXgYYlWL
	73Dd8hip+HywPLdZviZJA==
X-Gm-Gg: AYBFou3tnFh/BOL6YOkv3dT3jRbB2E8qvR/Gtvw6cqqduZ7vvAOOTHo0gBAgIK4nMdm
	Nke/TRNKm3lJbgQjOtRePsc93Vet6/IQJdDYszUhKr3Z+giaHXbRrU1YESWlZyGqXqtXKd0P6lb
	frQhU6gkI7i9vlig3lzYnX4itZzpjw6pnj6tmKwGbaDQbfjF1rjBDugqk1xrfMlZSDTFGaoIAO+
	Qr2bWCbM8vIizLnHJOXPO+MV4REJR7t1wCm1MOnqI4q1spNYWXYGYA5ekpipERCTP0xofKsbvOJ
	KAlfz26W8L0aHFOC6DTuyxGlHGZ5/KK9RQG0MVpJpNg/a1uFyY8WN7JfT4644H7OYSMLBwv9kUY
	SJbVY8sw4yjaE36kGEVz2sRq8hNDCMhlnCab0+F0QqxKbqDqkkkZZw6P6SNEm3tHBY6ZTsozxYn
	Dj4ZNb09Kh8OZ3QaNxXqjYBbRova7yTNin+yJW2vE=
X-Received: by 2002:a05:6a20:a107:b0:3da:bea4:6215 with SMTP id adf61e73a8af0-3db406861c6mr8784532637.19.1789416273385;
        Mon, 14 Sep 2026 13:04:33 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-39dfde2be1fsm288419a91.3.2026.09.14.13.04.30
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:04:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-66ce3040ea9so4901029d50.2
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416270; x=1790021070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gPHjF43uGTlI2Z7oUAXU9OxdN/wtUZfqVEKhDlGmvvM=;
        b=OBwzXnVM733uDNJL8JDYkTTGGpdq0p2DSYdpddV0Ld3pk2Q7mlCOnh0Ge8WYY/MpGy
         UdHuon+zzqAc6cRdLOLVQoqOZ6tPuQEqoZj7au0ODEZYfyA2ZhVWNx234FNis+oIeJ36
         2s2ogAjoEpBIc0EtTmVljT8HqY87lXteadL9c=
X-Forwarded-Encrypted: i=1; AKwUvByvPjcKRzKxIZ05JBwQZ2sPxronmbK9RCkuLOWehT1DdhenT1wRi1WWNd/7XzKIDTwVXJiEj6U52Bk=@lists.linux.dev
X-Received: by 2002:a05:690e:d0a:b0:66c:c7f5:df48 with SMTP id 956f58d0204a3-6714dfc875emr1263161d50.1.1789416269657;
        Mon, 14 Sep 2026 13:04:29 -0700 (PDT)
X-Received: by 2002:a05:690e:d0a:b0:66c:c7f5:df48 with SMTP id 956f58d0204a3-6714dfc875emr1263144d50.1.1789416269119;
        Mon, 14 Sep 2026 13:04:29 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47a6ebsm103068516d6.22.2026.09.14.13.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:04:28 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Jason Huang <Jason.Huang2@infineon.com>
Cc: linux-wireless@vger.kernel.org,
	Johannes Berg <johannes@sipsolutions.net>,
	brcm80211@lists.linux.dev,
	wlan-kernel-dev-list@infineon.com,
	Carella Chen <carella.chen@infineon.com>,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH v6 2/5] wifi: brcmfmac: detect firmware FBT and OKC support
Date: Mon, 14 Sep 2026 22:04:17 +0200
Message-ID: <20260914200417.1744264-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911065656.1269623-3-Jason.Huang2@infineon.com>
References: <20260911065656.1269623-3-Jason.Huang2@infineon.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Fri, 11 Sep 2026 14:56:53 +0800, Jason Huang wrote:
> From: Carella Chen <carella.chen@infineon.com>
> 
> Some firmware advertises Fast BSS Transition and Opportunistic Key
> Caching support through the firmware capability string. Track those
> capabilities so later roaming offload handling can be enabled only
> when firmware reports support.
> 
> Assisted-by: GitHub-Copilot-CLI:gpt-5.5

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend

> Signed-off-by: Carella Chen <carella.chen@infineon.com>
> Signed-off-by: Jason Huang <jason.huang2@infineon.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.c | 2 ++
>  drivers/net/wireless/broadcom/brcm80211/brcmfmac/feature.h | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
