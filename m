Received: from mail-pl1-f227.google.com (mail-pl1-f227.google.com [209.85.214.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9523A49B5B1
	for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 20:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789416255; cv=none; b=Fix5rmkRSK954+Q1KDQIIy48EEPdG82HK8rjbckzS3G/faPSVzgZzEzrqsnubfwnaM53K6geO/FS1RRcA6mJ5Wwhu1IEI+WMLc/FFCYzWnfz1FVRUY2Q8plltZNBS7lL/lSjsNVj6v1sgCyadFSOBCjitcL3WyCIDgHKhk120xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789416255; c=relaxed/simple;
	bh=gVBPMHDvUFZ7LHqXksbl0G8iSclpJgOhQy7Cg7sDOSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ViHExvonMVqA1FIEus83cm++TxTVcNA4hQdGTsswtoa7jIn7EQZLaXMFv2DyPUIIpWioTmzn6dIw3XVKgPuXcUxJzG7+ZHF+J23jkWEOGFF5MWimf3VlqnDTeLGosEDAI4NXbhXYXbj8goN9sXyALYEgnJoxKizjiRvj05F/Opc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=gCSZHHUs; arc=none smtp.client-ip=209.85.214.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="gCSZHHUs"
Received: by mail-pl1-f227.google.com with SMTP id d9443c01a7336-2d71d1cc8b2so21000795ad.1
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789416253; x=1790021053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pp623zgj8rh3D0bcXBH5BWiFVK6JWL+1hwJlGhtfFXM=;
        b=Wv8c6rZzdt2WQlLVnxcdr+I6LGH6XFQ7KtFWmam/iSOcwBiVII2/8MkV3eWqj0+Hfe
         20EtQUwDDQF2mCajtrTZ62AOqN20fFp2InOKN3IY8dgKbwXvAiGYbcC4CzWabIMSWloL
         OK6W6d9gQF3gR5gwPBL1sjgeVdglkcvIEOuTOoBZQs8pE/COiNfGpAD47rF/8qsm+jJz
         w6dh73vipNAh3lFXfKIIzxxwBDDNm3flM1xPBjh0FsHQDQBgyVgvmuMgITC2dzYDIGWn
         OcL8aYW6I1gi3Z7HphSY1T5OU+QfpYFKy9ibLZwBskdufD0iQ/HgjFbatVBEhCxP5WOR
         2oDA==
X-Forwarded-Encrypted: i=1; AKwUvBxSiTe0UjtDdG4kN5jIztczVpKs/ot9spLA4nhbsjwTjJ1rIldIi2VHfhX+/nXNYa3enan3hKVWezA=@lists.linux.dev
X-Gm-Message-State: AFuF++mmsIAMY3OgFDtExwW+0MZ6e6suqVXadW8Mel/akgtkKUMwp99s
	LJ5xTgTHbFLf++8M2tDU22TH8+xOgfcsEu1Fcmdk1MSyCyWTxYFTMgMBTahYn2V7hbr4g2SSePW
	29CQwaL016tATkFzEfpCn3ttlGUZM5oXEBNFo6m6gSk/aq+gDEdLAj0/NWTC4TSJnPdb/zuTjzA
	H1CaIPpcnvNysSTSke/grOewrAZnUQRUhREsXgnaYvNEnOzoEotwHriQ2qFy+88RvdI2SPsjcX0
	uvEhHSO7TR9DrsJVWX0ew==
X-Gm-Gg: AYBFou3/ggWHjDPc/5pUkCgwMrRfh9ze6TVwc7eWOXxrG2eJqHSpehtX+TtHamZPaPN
	Y5ek7W3jZpNJ5T7IhvqcX122pajMFHFVbfN5n/8e9kdM/RLFisrDU7a9vYnZ9/gKRPjTNk6/wP7
	h2GXP7xSA1T/PW5VZR5VXGCUen1oprj/JJRKBmd6NLdHY7llL1AlfEYHEnfQtWqJwAy1shzZU+8
	Gn7lrg/H+plquBtOQm07Fo30ByEijAgeG1zSq86SIgbTHniWrSyu2bIa3L9CTrs0rQNJqTtmiIU
	YTm2riGNbcemQvtlejhNIbnzrkE/Fhk94kyLLw9wpg5EmB9n2ECh5nxxK0K2iULpit6xmN6tXFu
	UtxT6zuKWR2P3DTWTyT3Y63l4SNg9hGMvGAMqjCOVUkqF2Fq/236yRbFJ4CB9IdI=
X-Received: by 2002:a17:902:e80e:b0:2ca:e19c:97b with SMTP id d9443c01a7336-2dd6c5cbdc7mr76496815ad.5.1789416252330;
        Mon, 14 Sep 2026 13:04:12 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com ([144.49.247.127])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2dd58eb909esm2739205ad.9.2026.09.14.13.04.11
        for <brcm80211@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2026 13:04:12 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-90e8341cfb4so79614886d6.0
        for <brcm80211@lists.linux.dev>; Mon, 14 Sep 2026 13:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789416251; x=1790021051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pp623zgj8rh3D0bcXBH5BWiFVK6JWL+1hwJlGhtfFXM=;
        b=gCSZHHUsQlqZOCS2tOj8Gh3GVEKxAq1g2SvFIPCUEJCvjPX0cNQxdFQ7omZ0yEny76
         Nj8n3oI8AsDZr2Fgm824mudNOICJe06s3AE7eJInxH/Y3WQ7loAtu8H/ZNLW/kjhJZp6
         pvfcL9vSgyl2fF8xT+c52lEcW1/eU8NBFeH4c=
X-Forwarded-Encrypted: i=1; AKwUvBxI8KJ1Rbf4w9QSK0uJ+ZIbpaaix590EY28nFfxbAqlguzvUFNATPI77IwpS2WSi77hzEZvaGADpk0=@lists.linux.dev
X-Received: by 2002:a05:6214:d8e:b0:90e:96a9:4c5d with SMTP id 6a1803df08f44-9122e4f371dmr67123616d6.15.1789416250695;
        Mon, 14 Sep 2026 13:04:10 -0700 (PDT)
X-Received: by 2002:a05:6214:d8e:b0:90e:96a9:4c5d with SMTP id 6a1803df08f44-9122e4f371dmr67122906d6.15.1789416250177;
        Mon, 14 Sep 2026 13:04:10 -0700 (PDT)
Received: from bld-bun-02.bun.broadcom.net ([192.19.176.227])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f47afc2sm102712366d6.20.2026.09.14.13.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 13:04:09 -0700 (PDT)
From: Arend van Spriel <arend.vanspriel@broadcom.com>
To: Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: linux-wireless@vger.kernel.org,
	brcm80211@lists.linux.dev,
	brcm80211-dev-list.pdl@broadcom.com,
	linux-kernel@vger.kernel.org,
	linux-rockchip@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH net-next] wifi: brcmfmac: Improve D3 substate entering timeout handling
Date: Mon, 14 Sep 2026 22:04:07 +0200
Message-ID: <20260914200407.1743850-1-arend.vanspriel@broadcom.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908-brcmfmac-bcm43752-suspend-fix-v1-1-32585639d763@collabora.com>
References: <20260908-brcmfmac-bcm43752-suspend-fix-v1-1-32585639d763@collabora.com>
Precedence: bulk
X-Mailing-List: brcm80211@lists.linux.dev
List-Id: <brcm80211.lists.linux.dev>
List-Subscribe: <mailto:brcm80211+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:brcm80211+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

On Tue, 08 Sep 2026 17:26:12 +0200, Sebastian Reichel wrote:
> Some firmwares (e.g. BCM43752) do not service the D3_INFORM mailbox
> handshake when idle, so the D3 ACK never arrives. If WoWL is not armed
> the device is going to be powered off during system suspend and
> re-probed on resume anyway (brcmf_pcie_pm_leave_D3() handles that), so
> the missing ACK is harmless and must not abort the whole system suspend.
> When WoWL is active the device has to stay powered with its state
> preserved, so keep treating the timeout as fatal.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>

[...]

> @@ -2653,8 +2653,13 @@ static int brcmf_pcie_pm_enter_D3(struct device *dev)
>  			   BRCMF_PCIE_MBDATA_TIMEOUT);
>  	if (!devinfo->mbdata_completed) {
>  		brcmf_err(bus, "Timeout on response for entering D3 substate\n");
> -		brcmf_bus_change_state(bus, BRCMF_BUS_UP);
> -		return -EIO;
> +
> +		if (devinfo->wowl_enabled) {
> +			brcmf_bus_change_state(bus, BRCMF_BUS_UP);
> +			return -EIO;
> +		}
> +
> +		brcmf_dbg(PCIE, "No D3 ACK, continuing to power the device off\n");
>  	}
>  
>  	devinfo->state = BRCMFMAC_PCIE_STATE_DOWN;

brcmf_err() is still emitted unconditionally on timeout, which means
affected devices will log an error message to dmesg on every suspend
even when WoWL is not armed and the missing ACK is expected/harmless.
Please move brcmf_err() inside the if (devinfo->wowl_enabled) check.

Also, please target wireless-next instead of net-next in the subject prefix
for the next version.

Regards,
Arend
