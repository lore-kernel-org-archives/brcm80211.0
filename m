Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.227
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795551255;
	b=UqeEPfjBJkvrrNSkflglYzoWYW4LnWjYTuZeWk4V9pcRxaSXFeYIlx3IxviO9gEP5zsA
	 wfCmT5ro2iP0f/uAnhCGwtnZRnrWFUV3qYwmwFN1cv9cvib5tEMy+jVfhQfu+Y6kU6nfj
	 csc2qAL7FsZdpnAWw8nqTblbNyWFBg7PQfmHSCbi1t1UfziXK95zxJ7omQHQr/Mm+vSDP
	 N0saIJgWhZ6ogB+sxXfyJjw4e16XOVu2BQS5ijEZrMBeR4ZaUxFrlauVlDbGDBFUEJmE2
	 fDHQCf5OcXFhS0x4cjsctv+GfMALMgBdYHc9LDpsEHgOxCfj9veAMRViyFtpv26MQAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795551255;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=rzyNqJtabncqEdEJhW68WGIEMuPJd31vZmYX/unj5Uk=;
	b=alEwOM/j6pQrTIVHEneUggsvVNKw8hDyd1VOKGZHQdPdBbexob9VpFolPW7NyffVIci1
	 wbSIHvG4NpI5HZEL0yxUoMOXp8+IbGYtaXqAc2TeEqyKqwCSEKH6h7vJeGlIu/iPbdD3Y
	 VnF6E+ZrykOd4HCy6hE/SCYLkANA6snq9z3k8apgm5P6jVtCzxzRjKyh+LD+D5II83ikg
	 CrMdU6fs5Yx4zHoTfS2HtKWdJuLBX0gRV/BQYY/yubBzxuUxvmnSRnQ7mM1o1VIlgdM/o
	 ApFYXSX/MsMw6LTddDFEM+GKGbRV9IEjDw7gKmTgylevKvXsVy0oX5ns3Q6iT6FjCGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P3USpveA;
	arc=none smtp.remote-ip=209.85.215.227
Received: from mail-pg1-f227.google.com (mail-pg1-f227.google.com [209.85.215.227])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2319C60A3812
	for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 20:14:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2319C60A3812
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P3USpveA
Received: by mail-pg1-f227.google.com with SMTP id 41be03b00d2f7-ccca948203aso3914610a12.3
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795551254; x=1796156054;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rzyNqJtabncqEdEJhW68WGIEMuPJd31vZmYX/unj5Uk=;
        b=B70KQeCZOy+Ar5otgJl8vPFCES+aBqdl5Ka16x+ndMUXoc3fePKaCI75puboOkxoGt
         O0oImlptsgvmdzE2aPuOCvgJZ4POGJIie+BfULr/q3IzP+NzVlWIrLDJFTv3As0poEx3
         veLneL4omRG0h6uJnkPu+NWZSBVNU7m2wWodLzATpIzt44WnzlZWyYBvubhQp70cUJP/
         fg+0WJA/DVWFEiR41hXW2fgvq5FwmRtGLH+vOOEsUr5j93AoWEZZpA0x5BD13Kk1gKrs
         l2vhubMuIUjNYJ4E+M8ZaPzT+b2Wp0RoxQpt8XFQTwIgIqCB8wsaecb5gFBP8O7tY8s+
         g4TQ==
X-Forwarded-Encrypted: i=1; AL+hErEtqCsaVfAjHEMKeGnMrEMdtANYdZ1mJRrrnu7LTUpToLyl0NFB7CFJem0ltOr1vEu5W63yfWenzbU=@lists.linux.dev
X-Gm-Message-State: APuU4Z/w4j6+KfeyDBBGWnsOy2jfXGWVnG92OSJk4bVSTIwTvHpZu0nT
	W5N3eBIyeEAdBORh4/6szSViThaL4FodZor61SopOdDDb1g4wYVFqqCwT9oLtPVJxEyTMYs+DnU
	t4dN2HzNyfUUmhqQBTx/eRU/QKXNBwEhVk/VynUTAPjL0B6FOQYj4s7SgjVUENe6mvrerxWHZMP
	A1vn7bIYXlHC4Un74OsiU1QP9DLzO8Snz8EVbO3jRUZg3siT6vnYfwBSN/UVNM8dlcWEaL5LoSW
	roxC7yXobcV4Xw4MS8=
X-Gm-Gg: AZFdTZevQq/4qTmmPSU6VFbOFAQ0J+jMwReoItELf7CsrQY3eAMUFhcvLy+F5csbwvV
	xUOdZRn8gtbIppSATHX6gE5vdFKanB49YgCaZa0UJ4yFJdL0YKg1yc/WVv9vnnmvi7bWxmE6WvH
	mbI5EAEye4atMBOzvCXFA3UCvdZfESgqzUbp8iQ6G2rmQVryahfVLSEW1MR/3viL9n7iVP67XkV
	K+AclhKPwi+wM6bb8OMELxPm1fCuag5bKbetOdyNmP+m/3JIihwy3EvS1ihdpZbWje7YcmXvi9x
	U1lxYomMYAkt1rj9rtqvx1lHTawVO6SnZ6TP8hSqQjMo+xGEwATMLgxGlLiCLcgDgDA4Y2oTH+r
	xOye9+QT0672B/mY7a6e8FMdUH/RORA8Kj2yzSuT5klIkwzyE/M6JFeMDH8XMIO0LtppPbItBDu
	oEjG/cmLRA8mvEvnsXKFLanNwMscdiNUj+QYjJ3ydujw==
X-Received: by 2002:a17:90b:4d86:b0:3ad:4a8b:c6fd with SMTP id 98e67ed59e1d1-3b41c93b159mr12393268a91.28.1795551254509;
        Tue, 24 Nov 2026 12:14:14 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-123.dlp.protect.broadcom.com. [144.49.247.123])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b41ffed164sm5156888a91.4.2026.11.24.12.14.14
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 Nov 2026 12:14:14 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9213237a52eso88272956d6.1
        for <brcm80211@lists.linux.dev>; Tue, 24 Nov 2026 12:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795551253; x=1796156053; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rzyNqJtabncqEdEJhW68WGIEMuPJd31vZmYX/unj5Uk=;
        b=P3USpveA1Y+fwkrMIFvTY98kDTj1VSno9aa/+SlLF7ejRKTxGnjiXXbabUlTdiYlIh
         NT31EhFhGym8zbYm+MJhksaFvTcixBtjPpDmUMBfKS7uypt0CpJRqbkOAb3kPXfg317V
         nTP6vwxkAF9PgAHKvhSOSt9MiCURjzuWWOz9A=
X-Forwarded-Encrypted: i=1; AL+hErFpFxP+GK3fYNSMzo9B/4ZS9OirHotwOp1tOwZp71CkisX+bSX3Ip8Uch/gw5XPENA0tNkIr253g7c=@lists.linux.dev
X-Received: by 2002:a05:6214:8018:b0:91f:2222:b498 with SMTP id 6a1803df08f44-92134b20d5amr225168146d6.27.1795551252942;
        Tue, 24 Nov 2026 12:14:12 -0800 (PST)
X-Received: by 2002:a05:6214:8018:b0:91f:2222:b498 with SMTP id 6a1803df08f44-92134b20d5amr225167466d6.27.1795551252306;
        Tue, 24 Nov 2026 12:14:12 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm141424066d6.41.2026.11.24.12.14.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 12:14:11 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>
Subject: Re: [PATCH wireless-next 6/7] wifi: brcmsmac: embed brcms_core in brcms_c_info
Date: Tue, 24 Nov 2026 21:14:00 +0100
Message-ID: <20261124201402.3499613-5-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261111042554.232998-7-rosenp@gmail.com>
References: <20261111042554.232998-7-rosenp@gmail.com>
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Post: <mailto:brcm80211@lists.linux.dev>
List-Help: <mailto:brcm80211+help@lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
List-Owner: <mailto:brcm80211+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 10 Nov 2026 20:25:53 -0800, Rosen Penev <rosenp@gmail.com> wrote:
> There is only one struct brcms_core and it has the same lifetime as
> struct brcms_c_info. Embed it directly instead of allocating it
> separately, removing one kzalloc()/kfree() pair and its OOM error path.
>
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.c | 9 +--------
>  drivers/net/wireless/broadcom/brcm80211/brcmsmac/main.h | 2 +-
>  2 files changed, 2 insertions(+), 9 deletions(-)

[...]

> @@ -470,7 +470,7 @@ struct brcms_c_info {
>  	/* multiband */
>  	struct brcms_core *core;
>  	struct brcms_band *band;
> -	struct brcms_core *corestate;
> +	struct brcms_core corestate;
>  	struct brcms_band bandstate[MAXBANDS];
>  
>  	/* packet queue */

With the embedded struct there is no need for the separate pointer
anymore. wlc->core always points at wlc->corestate, so the core pointer
could be dropped and the users could use &wlc->corestate directly.

Acked-by: Arend van Spriel <arend.vanspriel@broadcom.com>

Regards,
Arend
