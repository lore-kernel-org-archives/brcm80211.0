Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794825726;
	b=qm68ae7iWW2L5ofIivU7NI07RbAFuyc2qhx0/GpwiIbRkx6IgSgad+SwuJyQxbBEMql9
	 AnybTuxC6VqbTgQcYO6V+jxT4XsPhuwR34wKdpd5JqTwdji0bXUcMOuybCsQzRkja5duq
	 oWNwQQLZotMJJsxwbKp3S2814a7E4ZyyehaDmpS+B91RhnH3FGBwnwEktVFBQ4AJnxHRS
	 7MOmV7469b+o+Rxs+SX7w1O1wfYgAg/hsqR93N09YXKOTBWOkJ/EFkGyvoNjk+oCWDo1I
	 najF8vgAuWgHZWCZCfXOfDRv/6XyWJBacPJzB9zzEZU2CaKkHJwsmT3qWOWE21K3dCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794825726;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=3TnZeP/Myi6EwsvWImdUdCOwfUWWi1PsNVUc8BFWuNU=;
	b=B6qpVoUv6pK4iET+jmuc0avRcgQAUBdMC+1auEFpIVgLX/2xq7KsPHx5ruevZO024QxW
	 zEn3gbPOunT8pUb4ExMiDBBGOAR81ZqPQAcYELvhLsf5xe58lK6tuEwsKFtpLyfxoBH1i
	 IkLTIYtO+RWe1ODBZVXyMwPuLgqk7YxEGYMGzUvBQ4JqW2cHsc+wIdqc+p3lJN69djEts
	 gcXMxtgVJEWJyCYmufsdO2vfPC0vrhYoGzknvRV57cl/Y5wlgvFP/XtZUz4hOUTsu3f6q
	 ofsh1fndBvpClRFlYO+m+Y8ZlqCWjLUIH66cjBR4J804mQN9kPJs2WleaMnxwYkIJnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YX0b9Lbc;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B868606A32C
	for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 10:42:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B868606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=YX0b9Lbc
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b197cd42b0so2323710a91.2
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 02:42:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794825725; x=1795430525;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3TnZeP/Myi6EwsvWImdUdCOwfUWWi1PsNVUc8BFWuNU=;
        b=X5H5DFeGQA4Enrg7PnJrGT08TLF3umt6iNxEEdYp8Q8RZcu1rCdg98CykHKVrWgwAk
         foHYZ+4BoddGSLAYSdti3MZVgGVazukNG0ltesgzvYw6ZxxWek7dlDEU+qXHs1soWvaE
         0kq5GaTEXbEXnbhqzg0CKJ4bjxxyRgq/KSb7i6tOH/o4p2tFJbYIFBWcVk6RpjxuBh7Y
         8brMI7rFH0z+Gtvq4b5u6sYzK1zR+yR3gwupT8dtNzInpNuMVi1YnxVc3TqEd1lyPJCg
         fjRnkbLJMilAoJN8fh85iHo72GkOKyJAflXdcx1ZCovUyvDSHmhQu/TudKefNAjtjZb2
         3OVA==
X-Forwarded-Encrypted: i=1; AL+hErEHk4Wjn5wEPOvjv/K2jNrMlaPsjWWwetYKWt5NFuGXSYI3F+xF7DxAFLlBLcwfgUp6qCCpORBKPxk=@lists.linux.dev
X-Gm-Message-State: APuU4Z/+XaYze9x6lGRVfsG2C44+rbw6Qvj0MEKCAwPBMed0SvEqRb2V
	PgDTCblT0rNK599Nvmw893936X3e1jvKQKjwlZq4wDspL23+kGmnenjIVfOF4CAxb6D9G8ZmUcx
	sFif62bDGpfOPFcvLCCXvQEdHsaarV74OOBtlZgmjDkTF7buu9v8hif2YnAcGWrFBbCsX2geNNn
	Ib06f4b6mx4wXpTF0lo/w1Br3QkV22Oa46kDU99vi9ytkJ67j0T4ApNhS3WqHmkHOoYjcB9aIFP
	gHRD9/gjDgIYNv4f1yEmw==
X-Gm-Gg: AZFdTZetsfvo7IuSi7FMpH1drtwO/kf8lmIyBrFYmvEEufM9cKr+NAVW9eNKXcvXttF
	xqfFVzX/wD5u3cLHW4vPAyBcE+UV45f7OHhysGPuZKMhNR7nfQTErjqyp4AqhXQgS5HhnjnSmKW
	3Zz4Wm9/dbVTUDQ3jddCDjb9dEoFr6AMF2X7jFbj5pZtkj/1qKz9gd8jIPSdB4B39xvcpSiYhFd
	D/rS3lGeR/qTuWVCWB0v0CqBgnySaflWy8HiK2KFud5L9jK4lqERpY/RFYpqbS21N+xyVGwFbuY
	98/5VFPH9FrZDJsqdFcNu3H8Mhqxxw8JflKThSMZaNNLkE761GBJLs91juksgi8XSH/gQCKvy6C
	lDslYhdDmDMB6PcwCSx+YGyWk8brS8qP3ji+l+x/XhtkLREA70DxjSle7EGjTKPEZRzPUA8e1gt
	f6oGNPVw9+8coVungCzUI/ltkmbY8Q5OIT41c5PCw=
X-Received: by 2002:a17:90b:3c8e:b0:3b0:a3eb:7597 with SMTP id 98e67ed59e1d1-3b1b0b651fcmr8088421a91.51.1794825724634;
        Mon, 16 Nov 2026 02:42:04 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b1b25dd0d5sm5121062a91.0.2026.11.16.02.42.04
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Nov 2026 02:42:04 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f3969a2a7so517868785a.2
        for <brcm80211@lists.linux.dev>; Mon, 16 Nov 2026 02:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794825723; x=1795430523; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3TnZeP/Myi6EwsvWImdUdCOwfUWWi1PsNVUc8BFWuNU=;
        b=YX0b9Lbchv3WP74gC+johwWFA+QU2Bbq6C5W9JlpZMLaUxchX+sQq69P5Hcbj7wgeg
         /KMFYdU3TKPVSDU1XAcYFu65i2sf837J3VZxQD0UvgNWHe9fQQUls0hq+oNXkMqLtKyH
         2okppNFflNE+oi2z9QxxfyJpn5xhVGp4VC/OE=
X-Forwarded-Encrypted: i=1; AL+hErEoX3ti6lhlxpJINhtCuG9q4JB6XOsKTh1M0GIDP68nl/vEGcXLJKv902R6cTfXIqiyVHY+NCp64Bg=@lists.linux.dev
X-Received: by 2002:ac8:5ac2:0:b0:536:51d2:1e44 with SMTP id d75a77b69052e-55ac667dfc5mr167806941cf.22.1794825723533;
        Mon, 16 Nov 2026 02:42:03 -0800 (PST)
X-Received: by 2002:ac8:5ac2:0:b0:536:51d2:1e44 with SMTP id d75a77b69052e-55ac667dfc5mr167806701cf.22.1794825723025;
        Mon, 16 Nov 2026 02:42:03 -0800 (PST)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23efa2edsm82699996d6.15.2026.11.16.02.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 02:42:02 -0800 (PST)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Kordian Chmielewski <kudzo51@gmail.com>
Cc: linux-wireless@vger.kernel.org,
	Arend van Spriel <arend.vanspriel@broadcom.com>,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com
Subject: Re: [PATCH RESEND wireless-next] wifi: brcmfmac: delete the flowrings of an AP that stops or goes down
Date: Mon, 16 Nov 2026 11:41:58 +0100
Message-ID: <20261116104158.3133373-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261110231145.206744-1-kudzo51@gmail.com>
References: <20261110231145.206744-1-kudzo51@gmail.com>
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

On Wed, 11 Nov 2026 00:11:45 +0100, Kordian Chmielewski (mlody1212) wrote:
> Do the same, and when the AP stops: brcmf_flowring_delete_peer() without
> a peer now deletes every ring of the interface.
>
> Fixes: 9a1bb60250d2 ("brcmfmac: Adding msgbuf protocol.")
> Signed-off-by: Kordian Chmielewski (mlody1212) <kudzo51@gmail.com>

[...]

> @@ -5480,6 +5480,11 @@ static int brcmf_cfg80211_stop_ap(struct wiphy *wiphy, struct net_device *ndev,
>  		/* first to make sure they get processed by fw. */
>  		msleep(400);
>
> +		/* the BSS goes away and its rings with it: nothing else
> +		 * deletes the one for broadcast and multicast frames
> +		 */
> +		brcmf_proto_delete_peer(ifp->drvr, ifp->ifidx, NULL);
> +
>  		if (profile->use_fwauth != BIT(BRCMF_PROFILE_FWAUTH_NONE)) {
>  			struct cfg80211_crypto_settings crypto = {};

This is issued while the BSS is still up. A broadcast or multicast frame
sent after the delete response removed the ring, but before BRCMF_C_DOWN
below, creates a new flowring that then survives the stop, which is the
problem the patch sets out to fix. The E_LINK down event that
BRCMF_C_DOWN triggers is handled by the second hunk and deletes all rings
of the interface, so the call here is redundant for that case. Suggest
moving it to after BRCMF_C_DOWN, or dropping it and relying on the E_LINK
down event.

Regards,
Arend
